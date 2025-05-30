import QtQuick

Item {

    Image{
        id: videoPlayerIcon
        anchors{
            left: parent.right
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height *.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/video.png"
    }

    Image{
        id: calendarIcon
        anchors{
            left: videoPlayerIcon.right
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height *.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/calendar.png"
    }

    Image{
        id: iTunesIcon
        anchors{
            left: calendarIcon.right
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height *.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/itunes.png"
    }

    Image{
        id: spotifyIcon
        anchors{
            left: iTunesIcon.right
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height *.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/spotify.png"
    }

}
