import QtQuick

Rectangle {
    id: indicatorBar
    anchors {
        top: parent.top
        left: parent.left
        topMargin: 30
        leftMargin: 20
    }
    width: parent.width / 16
    height: parent.height / 3
    color: "#141414"

    Image {
        id: indicator1
        anchors {
            top: parent.top
            left: parent.left
        }
        width: parent.width
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/car-indicator1.png"
    }

    Image {
        id: indicator2
        anchors {
            top: indicator1.bottom
            left: parent.left
            topMargin: 20
        }
        width: parent.width
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/car-indicator3.png"
    }

    Image {
        id: indicator3
        anchors {
            top: indicator2.bottom
            left: parent.left
            topMargin: 20
        }
        width: parent.width
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/car-indicator.png"
    }

    Image {
        id: fastenSeatbelt
        anchors {
            top: indicator3.bottom
            left: parent.left
            topMargin: 30
        }
        width: parent.width
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/seatbelt.png"
    }
}
