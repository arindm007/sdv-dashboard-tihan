import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: rightIcons
    property color hoverColor: "#0099FF"
    property real iconOpacity: 0.8
    property real iconHoverOpacity: 1.0

    signal calendarClicked
    signal requestOpenUrl(string url)

    Row {
        spacing: 20
        anchors {
            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }

        // Video Player Icon
        Item {
            width: 50; height: 50
            Image {
                id: videoPlayerIcon
                anchors.fill: parent
                source: "qrc:Tesla/assets/video.png"
                opacity: iconOpacity
                fillMode: Image.PreserveAspectFit
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
            width: 50; height: 50
            Image {
                id: calendarIcon
                anchors.fill: parent
                source: "qrc:Tesla/assets/calendar.png"
                opacity: iconOpacity
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: calendarIcon.opacity = iconHoverOpacity
                onExited: calendarIcon.opacity = iconOpacity
                onClicked: {
                    console.log("Calendar icon clicked")
                    calendarClicked()
                }
            }
        }

        // iTunes Icon
        Item {
            width: 50; height: 50
            Image {
                id: iTunesIcon
                anchors.fill: parent
                source: "qrc:Tesla/assets/itunes.png"
                opacity: iconOpacity
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: iTunesIcon.opacity = iconHoverOpacity
                onExited: iTunesIcon.opacity = iconOpacity
                onClicked: {
                    console.log("iTunes icon clicked")
                    requestOpenUrl("https://www.itunes.com")
                }
            }
        }

        // Spotify Icon
        Item {
            width: 50; height: 50
            Image {
                id: spotifyIcon
                anchors.fill: parent
                source: "qrc:Tesla/assets/spotify.png"
                opacity: iconOpacity
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: spotifyIcon.opacity = iconHoverOpacity
                onExited: spotifyIcon.opacity = iconOpacity
                onClicked: {
                    console.log("Spotify icon clicked")
                    requestOpenUrl("https://www.spotify.com")
                }
            }
        }
    }
}
