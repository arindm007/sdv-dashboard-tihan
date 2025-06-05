import QtQuick
import QtQuick.Controls

Item {
    property string fontColor: "#EDEEEE"
    property int volumeLevel: 50   // Range: 0 to 100

    width: 86.25 * (parent.width / 1280)
    height: 40  // Adjust as needed

    Rectangle {
        id: decrementButton
        anchors {
            right: volumeIcon.left
            top: parent.top
            bottom: parent.bottom
            rightMargin: 15
        }
        width: parent.height / 2
        color: "#141414"

        Text {
            color: fontColor
            anchors.centerIn: parent
            text: "<"
            font.pixelSize: 12
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (volumeLevel > 0) volumeLevel -= 10
            }
        }
    }

    Image {
        id: volumeIcon
        height: parent.height * 0.5
        fillMode: Image.PreserveAspectFit
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        // Fixed volume icon regardless of volumeLevel
        source: "qrc:Tesla/assets/mediumVolume.png"
    }

    Rectangle {
        id: incrementButton
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        width: parent.height / 2
        color: "#141414"

        Text {
            color: fontColor
            anchors.centerIn: parent
            text: ">"
            font.pixelSize: 12
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (volumeLevel < 100) volumeLevel += 10
            }
        }
    }

    Rectangle {
        id: progressBarBackground
        height: 4
        width: parent.width * 0.5
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 4
        }
        color: "#2E2E2E"
        radius: 2

        Rectangle {
            id: progressBarFill
            width: progressBarBackground.width * (volumeLevel / 100)
            height: parent.height
            color: "#00BFFF"
            radius: 2
        }
    }
}
