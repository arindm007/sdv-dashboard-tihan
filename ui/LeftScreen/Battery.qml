import QtQuick

Rectangle{
    id: batteryDetails


    Image{
        id: battery
//        anchors.fill: parent * .50
        anchors{
            top: parent.top
            right: parent.right
//            bottom: batteryPercentage.bottom
        }
        width: parent.width * .50
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/battery1.png"
    }

    Text{
        id: batteryPercentage
        anchors.fill: parent * .50
        anchors{
            right: parent.left
            top: parent.top
//            verticalCenter: parent.verticalCenter
        }
        text: "50%"
        color: "black"
        font.pixelSize: 14
        height: parent.height * .69
    }
}
