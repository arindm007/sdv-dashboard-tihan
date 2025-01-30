import QtQuick

Item {
    property string fontColor: "#EDEEEE"

    width: 93.5 *(parent.width/1280)


    Rectangle{
        id: decrementButton
        anchors{
            left: parent.left
            top: parent.top
            bottom: parent.bottom
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


    Text{
        id: targetTemperature
        anchors{
            left: decrementButton.right
            verticalCenter: parent.verticalCenter
            leftMargin: 15
        }
        text: "70"
        color: fontColor
        font.pixelSize: 24
    }

    Rectangle{
        id: incrementButton
        anchors{
            left: targetTemperature.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: 15
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
