import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning
import QtQuick.Layouts
import QtMultimedia
import QtWebEngine

Rectangle {
    id: leftScreen
    anchors {
        left: parent.left
        top: parent.top
        // Assuming 'bottomBar' is an element defined elsewhere in your project
        // I've changed this to parent.bottom so the file can run standalone for testing.
        // Please change it back to `bottom: bottomBar.top` if needed.
        bottom: parent.bottom
        right: parent.right
    }
    color: "#141414"

    // Property to control the top-left indicator size
    property int indicatorFontSize: 15

    property var playlist: []
    property int currentIndex: -1
    property string currentTemp: "--°C"
    property var suggestions: []
    function fetchSuggestions(query) {
        const token = "pk.eyJ1IjoidmlzaG51MDQwNiIsImEiOiJjbWJhYmZxNmMxMWV2Mm1zNjFoN3ZkbzY0In0.Vt4LYyoSvctuJ5060Thc4Q"
        const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(query)}.json?access_token=${token}`

        var xhr = new XMLHttpRequest()
        xhr.open("GET", url)
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                var response = JSON.parse(xhr.responseText)
                suggestions = response.features
            }
        }
        xhr.send()
    }

    MediaPlayer {
        id: mediaPlayer
        autoPlay: false
        audioOutput: AudioOutput {
            volume: 1.0
        }
        onMediaStatusChanged: {
            if (mediaStatus === MediaPlayer.EndOfMedia) {
                nextTrack()
            }
        }
    }

    function search() {
        console.log("Searching Jamendo...")
        var url = "https://api.jamendo.com/v3.0/tracks?client_id=d0d7089b&format=json&audioformat=mp31&limit=10&namesearch=lofi"
        var xhr = new XMLHttpRequest()
        xhr.open("GET", url)
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                var json = JSON.parse(xhr.responseText)
                validateAudioUrls(json.results)
            }
        }
        xhr.send()
    }

    function validateAudioUrls(rawTracks) {
        var validTracks = rawTracks.filter(function (track) {
            return track.audio !== undefined && track.audio !== ""
        })
        playlist = validTracks
        if (playlist.length > 0) {
            currentIndex = 0
            playTrack(0)
        }
    }

    function playTrack(index) {
        if (index < 0 || index >= playlist.length)
            return
        currentIndex = index
        mediaPlayer.source = playlist[index].audio
        mediaPlayer.play()
    }

    function nextTrack() {
        if (currentIndex + 1 < playlist.length) {
            currentIndex++
            playTrack(currentIndex)
        }
    }

    function prevTrack() {
        if (currentIndex - 1 >= 0) {
            currentIndex--
            playTrack(currentIndex)
        }
    }

    Component.onCompleted: {
        search()
        // Trigger the clock once on startup for immediate display
        clockTimer.trigger()
    }

    Image {
        id: carRender
        anchors.centerIn: parent
        width: parent.width * 0.25
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/Bus.png"
    }

    Row {
        id: infoBoxes
        anchors.top: carRender.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: carRender.horizontalCenter
        spacing: 10
        Rectangle {
            width: 300
            height: 102
            color: "darkgray"
            Column {
                anchors.fill: parent
                Rectangle {
                    width: 300
                    height: 49
                    color: "transparent"
                    Row {
                        anchors.fill: parent
                        anchors.margins: 5
                        spacing: 10
                        Image {
                            id: songCover
                            width: 40
                            height: 40
                            fillMode: Image.PreserveAspectCrop
                            source: playlist.length > 0 ? playlist[currentIndex].album_image : "qrc:Tesla/assets/default_cover.png"
                            smooth: true
                        }
                        Column {
                            spacing: 2
                            Text {
                                id: songTitle
                                text: playlist.length > 0 ? playlist[currentIndex].name : "Title"
                                color: "white"
                                font.pixelSize: 14
                                font.bold: true
                                elide: Text.ElideRight
                                width: 240
                            }
                            Text {
                                id: songArtist
                                text: playlist.length
                                      > 0 ? playlist[currentIndex].artist_name : "Artist"
                                color: "#cccccc"
                                font.pixelSize: 12
                                elide: Text.ElideRight
                                width: 240
                            }
                        }
                    }
                }

                Rectangle {
                    id: progressBar
                    width: 300
                    height: 2
                    radius: 0
                    color: "transparent"
                    clip: true

                    Rectangle {
                        id: progressFill
                        anchors.left: parent.left
                        height: parent.height
                        width: (mediaPlayer.duration > 0) ? progressBar.width * (mediaPlayer.position / mediaPlayer.duration) : 0
                        color: "black"
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            if (mediaPlayer.duration > 0) {
                                let clickRatio = mouse.x / progressBar.width
                                let newPos = mediaPlayer.duration * clickRatio
                                mediaPlayer.position = newPos  // ✅ Correct method
                                progressFill.width = progressBar.width * clickRatio
                            }
                        }
                    }

                    Connections {
                        target: mediaPlayer
                        function onPositionChanged() {
                            if (mediaPlayer.duration > 0) {
                                progressFill.width = progressBar.width * (mediaPlayer.position / mediaPlayer.duration)
                            }
                        }
                    }
                }




                Rectangle {
                    width: 300
                    height: 49
                    color: "transparent"

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 5
                        anchors.leftMargin: 30
                        spacing: 6

                        // Previous Track
                        Rectangle {
                            width: 30
                            height: 30
                            radius: 8
                            color: prevMouse.containsMouse ? "#444444" : "transparent"

                            Image {
                                anchors.centerIn: parent
                                source: "qrc:Tesla/assets/backward.png"
                                width: 24
                                height: 24
                                fillMode: Image.PreserveAspectFit
                            }

                            MouseArea {
                                id: prevMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: prevTrack()
                            }
                        }

                        // Play / Pause
                        Rectangle {
                            width: 30
                            height: 30
                            radius: 8
                            color: playMouse.containsMouse ? "#444444" : "transparent"

                            // Dynamically change image based on mediaPlayer state
                            Image {
                                anchors.centerIn: parent
                                source: mediaPlayer.playbackState === MediaPlayer.PlayingState
                                        ? "qrc:Tesla/assets/play.png"
                                        : "qrc:Tesla/assets/player.png"
                                width: 24
                                height: 24
                                fillMode: Image.PreserveAspectFit
                            }

                            MouseArea {
                                id: playMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    if (mediaPlayer.playbackState === MediaPlayer.PlayingState)
                                        mediaPlayer.pause()
                                    else
                                        mediaPlayer.play()
                                }
                            }
                        }

                        // Next Track
                        Rectangle {
                            width: 30
                            height: 30
                            radius: 8
                            color: nextMouse.containsMouse ? "#444444" : "transparent"

                            Image {
                                anchors.centerIn: parent
                                source: "qrc:Tesla/assets/next.png"
                                width: 24
                                height: 24
                                fillMode: Image.PreserveAspectFit
                            }

                            MouseArea {
                                id: nextMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: nextTrack()
                            }
                        }

                        // Search Button

                    }
                }

            }
        }
        Rectangle {
            width: 300
            height: 100
            color: "darkgray"

            property bool showSearch: false
            property var suggestions: []

            // Layer 1: Search Bar & Suggestions
            Rectangle {
                width: 300
                height: 100
                color: "transparent"
                z: 1

                Column {
                    spacing: 0

                    // 🔍 Search Row
                    Rectangle {
                        width: 300
                        height: 49
                        color: "transparent"

                        Row {
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 10
                            anchors.left: parent.left
                            anchors.leftMargin: 10

                            MouseArea {
                                id: searchArea
                                width: 30
                                height: 30
                                onClicked: showSearch = !showSearch

                                Image {
                                    anchors.centerIn: parent
                                    source: "qrc:Tesla/assets/search.png"
                                    width: 20
                                    height: 20
                                    fillMode: Image.PreserveAspectFit
                                }
                            }

                            Rectangle {
                                width: 230
                                height: 50
                                color: "transparent"

                                TextField {
                                    id: searchField
                                    visible: showSearch
                                    placeholderText: "Navigate"
                                    width: parent.width
                                    height: 40
                                    color: "white"
                                    font.pixelSize: 16

                                    background: Rectangle {
                                        color: "transparent"
                                        radius: 6
                                    }

                                    Keys.onReturnPressed: {
                                        if (text.length > 0) {
                                            webView.url = "http://127.0.0.1:5001/?q=" + encodeURIComponent(text)
                                            webPopup.open()
                                            suggestions = []
                                        }
                                    }

                                    onTextChanged: {
                                        if (text.length > 2) {
                                            fetchSuggestions(text)
                                        } else {
                                            suggestions = []
                                        }
                                    }
                                }

                                // 🔽 Suggestion List
                                ListView {
                                    id: suggestionList
                                    width: 300
                                    height: Math.min(5, suggestions.length) * 50
                                    anchors.top: searchField.bottom
                                    anchors.left: parent.left
                                    anchors.leftMargin: -50
                                    visible: suggestions.length > 0 && searchField.visible
                                    z: 2
                                    model: suggestions
                                    clip: true

                                    Rectangle {
                                        z: -1
                                        anchors.fill: parent
                                        radius: 6
                                        color: "#1e1e1e"
                                        border.color: "#444"
                                    }

                                    delegate: Rectangle {
                                        width: parent.width
                                        height: 50
                                        color: "#292929"
                                        border.color: "#444"
                                        border.width: 1

                                        Text {
                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.left: parent.left
                                            anchors.leftMargin: 10
                                            width: parent.width - 20
                                            text: modelData.place_name
                                            color: "white"
                                            font.pixelSize: 14
                                            wrapMode: Text.WrapAnywhere
                                            elide: Text.ElideRight
                                            maximumLineCount: 2
                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onClicked: {
                                                searchField.text = modelData.place_name
                                                suggestions = []
                                                webView.url = "http://127.0.0.1:5001/?q=" + encodeURIComponent(modelData.place_name)
                                                webPopup.open()
                                            }
                                            onEntered: parent.color = "#383838"
                                            onExited: parent.color = "#292929"
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        width: 300
                        height: 2
                        color: "#1e1e1e"
                    }
                }
            }

            // Layer 0: Button Bar (underneath suggestion list)
            Rectangle {
                width: 300
                height: 49
                y: 51
                color: "transparent"
                z: 0

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.leftMargin: 30
                    spacing: 6

                    // Buttons (unchanged)
                    Rectangle {
                        width: 30
                        height: 30
                        color: button1MouseArea.containsMouse ? "#444444" : "transparent"
                        radius: 8

                        Image {
                            anchors.centerIn: parent
                            source: "qrc:Tesla/assets/map.png"
                            width: 24
                            height: 24
                            fillMode: Image.PreserveAspectFit
                        }

                        MouseArea {
                            id: button1MouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                webView.url = "http://127.0.0.1:5001"
                                webPopup.open()
                            }
                        }
                    }

                    Rectangle {
                        width: 30
                        height: 30
                        color: button2MouseArea.containsMouse ? "#444444" : "transparent"
                        radius: 8

                        Image {
                            anchors.centerIn: parent
                            source: "qrc:Tesla/assets/maingate.png"
                            width: 24
                            height: 24
                            fillMode: Image.PreserveAspectFit
                        }

                        MouseArea {
                            id: button2MouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                webView.url = "http://127.0.0.1:5001/?dest=17.580583898578812,78.12108904073668"
                                webPopup.open()
                            }
                        }
                    }

                    Rectangle {
                        width: 30
                        height: 30
                        color: button3MouseArea.containsMouse ? "#444444" : "transparent"
                        radius: 8

                        Image {
                            anchors.centerIn: parent
                            source: "qrc:Tesla/assets/hostel.png"
                            width: 24
                            height: 24
                            fillMode: Image.PreserveAspectFit
                        }

                        MouseArea {
                            id: button3MouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {

                                webView.url = "http://127.0.0.1:5001/?dest=17.59688100721301,78.12525148121856"
                                webPopup.open()
                            }
                        }
                    }

                    Rectangle {
                        width: 30
                        height: 30
                        color: button4MouseArea.containsMouse ? "#444444" : "transparent"
                        radius: 8

                        Image {
                            anchors.centerIn: parent
                            source: "qrc:Tesla/assets/testbed.png"
                            width: 24
                            height: 24
                            fillMode: Image.PreserveAspectFit
                        }

                        MouseArea {
                            id: button4MouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                webView.url = "http://127.0.0.1:5001/?dest=17.60171149557549,78.12700735792613"
                                webPopup.open()
                            }
                        }
                    }
                }
            }
        }

    }
    //17.60171149557549, 78.12700735792613--tihan
    //17.59688100721301, 78.12525148121856--hostel geoCircle
    //17.580583898578812, 78.12108904073668--maingate
    Image {
        id: battery
        anchors {
            top: parent.top
            right: parent.right
        }
        width: parent.width / 12
        height: parent.height / 12
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/battery1.png"
    }
    Rectangle {
        id: percentageRect
        anchors {
            top: battery.top
            bottom: battery.bottom
            right: battery.left
        }
        width: parent.width * 0.05
        color: "#141414"
        Text {
            id: batteryPercentage
            anchors.centerIn: parent
            text: "50%"
            color: "white"
            font.pixelSize: 18
        }
    }
    //IndicatorBar {
    //    id: indicatorBar
    //}
    Image {
        id: seatBealtWarning
        anchors {
            bottom: parent.bottom
            left: parent.left
            leftMargin: 30
            bottomMargin: 10
        }
        width: parent.width / 24
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/warning.png"
    }
    Text {
        id: warningText
        anchors {
            left: seatBealtWarning.right
            verticalCenter: seatBealtWarning.verticalCenter
            leftMargin: 12
        }
        text: "Fasten your seatbelt!"
        font.pixelSize: 18
        font.bold: true
        color: "#8B8B88"
    }

    Item {
        id: overlay
        anchors.fill: parent

        Row {
            id: topLeftRow
            anchors {
                left: parent.left
                top: parent.top
                margins: 15
            }
            spacing: 20 // Adjusted spacing
            z: 1

            Image {
                id: carLocked
                width: leftScreen.indicatorFontSize * 1.4
                fillMode: Image.PreserveAspectFit
                source: "qrc:Tesla/assets/lock-white.png" // Using the white version
                anchors.verticalCenter: parent.verticalCenter
            }

            // *** MODIFIED: Clock is now a Column with two Text elements ***
            Text {
                id: timeDisplay
                font.pixelSize: leftScreen.indicatorFontSize
                font.bold: true
                color: "white"
            }

            Text {
                id: dateDisplay
                // Slightly smaller and not bold for a nice visual hierarchy
                font.pixelSize: leftScreen.indicatorFontSize - 2
                font.bold: true
                color: "white"
            }

            // *** MODIFIED: Timer now updates both date and time ***
            Timer {
                id: clockTimer
                interval: 1000 // Update every second
                repeat: true
                running: true
                onTriggered: {
                    var now = new Date()

                    // Get and format date components
                    var day = now.getDate()
                    var month = now.getMonth() + 1 // JS months are 0-11
                    var year = now.getFullYear()

                    // Get and format time components
                    var hours = now.getHours()
                    var minutes = now.getMinutes()
                    var seconds = now.getSeconds()

                    // Zero-padding for a consistent "01" vs "1" look
                    if (day < 10)
                        day = "0" + day
                    if (month < 10)
                        month = "0" + month
                    if (hours < 10)
                        hours = "0" + hours
                    if (minutes < 10)
                        minutes = "0" + minutes
                    if (seconds < 10)
                        seconds = "0" + seconds

                    // Update the two text fields
                    timeDisplay.text = hours + ":" + minutes + ":" + seconds
                    dateDisplay.text = day + "/" + month + "/" + year
                }
            }

            Timer {
                id: weatherTimer
                interval: 1800000 // 30 minutes
                running: true
                repeat: true
                onTriggered: getWeather()
            }

            function getWeather() {
                const city = "Hyderabad" // Change to your city or use lat/lon
                const apiKey = "c34f6f74808dc7789e6eb6ae9bacce8f"
                const url = "https://api.openweathermap.org/data/2.5/weather?q="
                          + city + "&appid=" + apiKey + "&units=metric"

                var xhr = new XMLHttpRequest()
                xhr.open("GET", url)
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE
                            && xhr.status === 200) {
                        var data = JSON.parse(xhr.responseText)
                        currentTemp = Math.round(data.main.temp) + "°C"
                    }
                }
                xhr.send()
            }

            Component.onCompleted: {
                clockTimer.start()
                weatherTimer.start()
                getWeather()
            }

            Text {
                text: currentTemp
                color: "white"
                font.pixelSize: 16
                font.bold: true
            }

            Text {
                id: profileDisplay
                text: "Vishnu-Alamuri"
                font.pixelSize: leftScreen.indicatorFontSize
                font.bold: true
                color: "white"
            }
        }
    }
    // === Embedded Web Viewer Overlay ===
    Popup {
        id: webPopup
        modal: true
        focus: true
        width: parent.width * 0.3          // Reduced width
        height: parent.height * 0.5
        x: carRender.x + carRender.width + 20
         // To the left of Bus.png with spacing
        y: carRender.y -100                       // Slightly above Bus.png
        visible: false

        background: Rectangle {
            color: "#101010"
            radius: 10
            border.color: "#333"
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            RowLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight
                Button {
                    text: "Close"
                    onClicked: webPopup.close()
                }
            }

            WebEngineView {
                id: webView
                url: "about:blank"
                Layout.fillWidth: true
                Layout.fillHeight: true
            }



        }
    }



}


