import QtQuick

Rectangle {
    id: batteryDetails
    color: "#141414"

    Image {
        id: battery
        anchors {
            top: parent.top
            right: parent.right
        }
        width: parent.width * 0.5
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/battery1.png"
    }

    Rectangle {
        id: batteryTextBackground
        width: parent.width * 0.5
        height: parent.height
        color: "#141414"

        anchors {
            left: parent.left
            top: parent.top
        }

        Text {
            id: batteryPercentage
            anchors.centerIn: parent
            text: "50%"
            color: "white"
            font.pixelSize: 14
        }
    }
}
