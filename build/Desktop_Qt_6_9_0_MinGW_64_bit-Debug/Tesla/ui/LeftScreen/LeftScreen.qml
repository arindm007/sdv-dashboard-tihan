import QtQuick

Rectangle {
    id: leftScreen
    anchors {
        left: parent.left
        top: parent.top
        bottom: bottomBar.top
        right: rightScreen.left
    }
    color: "#141414"

    //        color: "white"
    Image {
        id: carRender
        anchors.centerIn: parent
        width: parent.width * .75
        fillMode: Image.PreserveAspectFit
        //source: "qrc:Tesla/assets/Car.jpeg"
        source: "qrc:Tesla/assets/Bus.png"
    }

    //    Battery{
    //        id: batteryDetails
    //        anchors{
    //            right: parent.right
    //            top: parent.top
    //        }
    //        height: parent.height * .069
    //        width: parent.width * .2
    //    }
    Image {
        id: battery
        //        anchors.fill: parent * .50
        anchors {
            top: parent.top
            right: parent.right
            //            bottom: batteryPercentage.bottom
        }
        width: parent.width / 6
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
        width: parent.width * .1
        color: "#141414"

        Text {
            id: batteryPercentage
            anchors {
                //                right: battery.left
                //            top: battery.top
                //            bottom: battery.bottom
                verticalCenter: parent.verticalCenter
            }
            text: "50%"
            color: "white"
            font.pixelSize: 14 * (leftScreen.width / 300)
            //            height: parent.height * .69
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
        width: parent.width / 6
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
        font.pixelSize: 14 * (leftScreen.width / 300)
        font.bold: true
        color: "#8B8B88"

        Component.onCompleted: console.log(height)

        verticalAlignment: Text.AlignVCenter
    }
}
