import QtQuick

Item {
    property string fontColor: "#EDEEEE"
    property int targetTemp: 18 // Holds the current temperature

    width: 93.5 * (parent.width / 1280)

    Rectangle {
        id: decrementButton
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        width: parent.height / 2
        color: "#141414"

        Text {
            id: decrementText
            color: fontColor
            anchors.centerIn: parent
            text: "<"
            font.pixelSize: 12
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (targetTemp > 16)
                    targetTemp-- // Minimum temp guard
            }
        }
    }

    Text {
        id: targetTemperature
        anchors {
            left: decrementButton.right
            verticalCenter: parent.verticalCenter
            leftMargin: 15
        }
        text: targetTemp.toString()
        color: fontColor
        font.pixelSize: 24
    }

    Rectangle {
        id: incrementButton
        anchors {
            left: targetTemperature.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: 15
        }

        width: parent.height / 2
        color: "#141414"

        Text {
            id: incrementText
            color: fontColor
            anchors.centerIn: parent
            text: ">"
            font.pixelSize: 12
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (targetTemp < 30)
                    targetTemp++ // Maximum temp guard
            }
        }
    }
}
