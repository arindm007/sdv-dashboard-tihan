import QtQuick

Rectangle {
    id: bottomBar
    property alias rightIcons: rightIcons
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    height: parent.height / 12
    color: "#141414"

    Image {
        id: carSettingsIcon
        anchors {
            left: parent.left
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * .85
        fillMode: Image.PreserveAspectFit
        source: "qrc:/Tesla/assets/carIcon.png"
    }

    HVACComponent {
        id: driverHAC
        anchors {
            left: carSettingsIcon.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: 50
        }
    }

    HVACComponent {
        id: passengerHAC
        anchors {
            right: volumeController.left
            top: parent.top
            bottom: parent.bottom
            rightMargin: 100
        }
    }

    VolumeController {
        id: volumeController
        anchors {
            right: parent.right
            rightMargin: 30
            top: parent.top
            bottom: parent.bottom
        }
    }

    Image {
        id: separaterIcon
        anchors {
            //            left: moreItemsIcon.right
            //            leftMargin: 20
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        height: parent.height * .5
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/line.png"
    }

    //    Icons{
    //        id: bottomBarIcons
    //        anchors{
    ////            left: driverHAC.right
    ////            right: passengerHAC.left
    ////            leftMargin: 100
    ////            rightMargin: 100
    ////            top: parent.top
    ////            bottom: parent.bottom
    //            horizontalCenter: parent.horizontalCenter
    //        }
    //        height: parent.height
    //    }
    LeftIcons {
        id: leftIcons
        anchors {
            right: separaterIcon.left
            verticalCenter: parent.verticalCenter
        }
        height: parent.height
    }

    RightIcons {
        id: rightIcons
        anchors {
            left: separaterIcon.right
            verticalCenter: parent.verticalCenter
            rightMargin: 20
        }
        height: parent.height
    }
}
