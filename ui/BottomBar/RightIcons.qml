import QtQuick

Item {
    // Base properties for all icons
    property color hoverColor: "#0099FF"   // Light blue tint on hover (not used but ready)
    property real iconOpacity: 0.8          // Default icon opacity
    property real iconHoverOpacity: 1.0     // Opacity when hovered

    // Video Player Icon
    Item {
        id: videoPlayerIconWrapper
        anchors {
            left: parent.right
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.5
        width: height

        Image {
            id: videoPlayerIcon
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:Tesla/assets/video.png"
            opacity: iconOpacity
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onEntered: videoPlayerIcon.opacity = iconHoverOpacity
            onExited: videoPlayerIcon.opacity = iconOpacity

            onClicked: {
                console.log("Video Player icon clicked")
            }
        }
    }

    // Calendar Icon
    Item {
        id: calendarIconWrapper
        anchors {
            left: videoPlayerIconWrapper.right
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.5
        width: height

        Image {
            id: calendarIcon
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:Tesla/assets/calendar.png"
            opacity: iconOpacity
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onEntered: calendarIcon.opacity = iconHoverOpacity
            onExited: calendarIcon.opacity = iconOpacity

            onClicked: {
                console.log("Calendar icon clicked")
            }
        }
    }

    // iTunes Icon
    Item {
        id: iTunesIconWrapper
        anchors {
            left: calendarIconWrapper.right
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.5
        width: height

        Image {
            id: iTunesIcon
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:Tesla/assets/itunes.png"
            opacity: iconOpacity
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onEntered: iTunesIcon.opacity = iconHoverOpacity
            onExited: iTunesIcon.opacity = iconOpacity

            onClicked: {
                console.log("iTunes icon clicked")
            }
        }
    }

    // Spotify Icon
    Item {
        id: spotifyIconWrapper
        anchors {
            left: iTunesIconWrapper.right
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.5
        width: height

        Image {
            id: spotifyIcon
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:Tesla/assets/spotify.png"
            opacity: iconOpacity
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onEntered: spotifyIcon.opacity = iconHoverOpacity
            onExited: spotifyIcon.opacity = iconOpacity

            onClicked: {
                console.log("Spotify icon clicked")
            }
        }
    }
}
