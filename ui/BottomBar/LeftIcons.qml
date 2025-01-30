import QtQuick

Item {

    Image{
        id: callIcon
        anchors{
            right: recorderIcon.left
            verticalCenter: parent.verticalCenter
            rightMargin: 20
        }
        height: parent.height *.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/phone-call.png"
    }

    Image{
        id: recorderIcon
        anchors{
            right: cameraLensIcon.left
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height *.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/audio.png"
    }

    Image{
        id: cameraLensIcon
        anchors{
            right: moreItemsIcon.left
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height *.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/camera-lens.png"
    }

    Image{
        id: moreItemsIcon
        anchors{
            right: parent.right
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height *.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/more.png"
    }

}
