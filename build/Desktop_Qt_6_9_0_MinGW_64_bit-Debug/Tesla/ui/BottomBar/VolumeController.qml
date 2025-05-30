import QtQuick

Item {
    property string fontColor: "#EDEEEE"

    width: 86.25 *(parent.width/1280)


    Rectangle{
        id: decrementButton
        anchors{
            right: volumeIcon.left
            top: parent.top
            bottom: parent.bottom
            rightMargin: 15
        }

        width: parent.height/2
        color: "black"

        Text{
            id: decrementText
            color: fontColor
            anchors.centerIn: parent
            text: "<"
            font.pixelSize: 12
        }
    }


    Image{
        id: volumeIcon
        height: parent.height* .5
        fillMode: Image.PreserveAspectFit
        anchors{
            right: incrementButton.left
            verticalCenter: parent.verticalCenter
            rightMargin: 15
        }
        source: "qrc:Tesla/assets/mediumVolume.png"


    }

    Rectangle{
        id: incrementButton
        anchors{
            right: parent.right
            top: parent.top
            bottom: parent.bottom
//            rightMargin: 15
        }

        width: parent.height/2
        color: "black"

        Text{
            id: incrementText
            color: fontColor
            anchors.centerIn: parent
            anchors.leftMargin: 15
            text: ">"
            font.pixelSize: 12
        }
    }

}
