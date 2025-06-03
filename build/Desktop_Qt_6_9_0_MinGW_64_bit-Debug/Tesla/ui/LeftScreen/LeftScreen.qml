import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning

Rectangle {
    id: leftScreen
    anchors {
        left: parent.left
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }
    color: "#141414"

    // Left (car render, indicators, battery, etc.)
    Image {
        id: carRender
        anchors.centerIn: parent
        width: parent.width * 0.25
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/Bus.png"
    }

    Image {
        id: dummyBelowBus
        anchors.top: carRender.bottom
        anchors.horizontalCenter: carRender.horizontalCenter
        anchors.topMargin: 100
        width: carRender.width * 1.5 // increase size by 50%
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/dummy.png"
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
            anchors.verticalCenter: parent.verticalCenter
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
