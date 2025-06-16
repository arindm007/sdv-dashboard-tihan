import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning
import QtQuick.Layouts
import QtMultimedia

Rectangle {
    id: leftScreen
    anchors {
        left: parent.left
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }
    color: "#141414"

    property var playlist: []
    property int currentIndex: -1

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
        console.log("Playing track:", playlist[index].name)
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
            height: 100
            color: "darkgray"

            Column {
                anchors.fill: parent

                Rectangle {
                    width: 300
                    height: 49
                    color: "#3a3a3a"
                    //radius: 4
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

                Slider {
                    id: progressSlider
                    width: 300
                    height: 2
                    from: 0
                    to: mediaPlayer.duration > 0 ? mediaPlayer.duration : 1
                    value: mediaPlayer.position

                    background: Rectangle {
                        implicitHeight: 2
                        color: "#555"
                        //radius: 3
                    }

                    handle: Rectangle {
                        width: 10
                        height: 10
                        radius: 5
                        color: "#fff"
                        border.color: "#888"
                        border.width: 1
                    }

                    onMoved: {
                        mediaPlayer.seek(value)
                    }

                    // Real-time sync with player
                    Timer {
                        id: updateSlider
                        interval: 1000
                        repeat: true
                        running: true
                        onTriggered: {
                            if (!progressSlider.pressed) {
                                progressSlider.to = mediaPlayer.duration
                                        > 0 ? mediaPlayer.duration : 1
                                progressSlider.value = mediaPlayer.position
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

                        Button {
                            onClicked: prevTrack()
                            background: Rectangle {
                                color: "transparent"
                                Image {
                                    anchors.centerIn: parent
                                    source: "qrc:Tesla/assets/backward.png"
                                    width: 24
                                    height: 24
                                    fillMode: Image.PreserveAspectFit
                                }
                            }
                        }

                        Button {
                            onClicked: {
                                if (mediaPlayer.playbackState === MediaPlayer.PlayingState)
                                    mediaPlayer.pause()
                                else
                                    mediaPlayer.play()
                            }
                            background: Rectangle {
                                color: "transparent"
                                Image {
                                    anchors.centerIn: parent
                                    source: "qrc:Tesla/assets/play.png"
                                    width: 24
                                    height: 24
                                    fillMode: Image.PreserveAspectFit
                                }
                            }
                        }

                        Button {
                            onClicked: nextTrack()
                            background: Rectangle {
                                color: "transparent"
                                Image {
                                    anchors.centerIn: parent
                                    source: "qrc:Tesla/assets/next.png"
                                    width: 24
                                    height: 24
                                    fillMode: Image.PreserveAspectFit
                                }
                            }
                        }

                        Button {
                            onClicked: search()
                            background: Rectangle {
                                color: "transparent"
                                Image {
                                    anchors.centerIn: parent
                                    source: "qrc:Tesla/assets/search.png"
                                    width: 24
                                    height: 24
                                    fillMode: Image.PreserveAspectFit
                                }
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            width: 300
            height: 100
            color: "darkgray"
        }
    }

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

    IndicatorBar {
        id: indicatorBar
    }

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
            bottom: seatBealtWarning.bottom
            leftMargin: 12
            verticalCenter: seatBealtWarning.verticalCenter
        }
        text: "Fasten your seatbelt!"
        font.pixelSize: 18
        font.bold: true
        color: "#8B8B88"
        verticalAlignment: Text.AlignVCenter
    }

    Item {
        id: overlay
        anchors.fill: parent

        Row {
            id: topLeftRow
            anchors {
                left: parent.left
                top: parent.top
                margins: 10
            }
            spacing: 40
            z: 1

            Image {
                id: carLocked
                width: parent.width / 40
                fillMode: Image.PreserveAspectFit
                source: "qrc:Tesla/assets/lock.png"
            }

            Text {
                id: dateTimeDisplay
                font.pixelSize: 18
                font.bold: true
                color: "white"
                text: "11:58"
            }

            Text {
                id: temperatureDisplay
                font.pixelSize: 18
                font.bold: true
                color: "white"
                text: "27°C"
            }

            Text {
                id: profileDisplay
                font.pixelSize: 18
                font.bold: true
                color: "white"
                text: "Vishnu-Alamuri"
            }
        }
    }
}
