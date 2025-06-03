import QtQuick
import QtQuick.Window
import QtQuick.Controls

import "ui/BottomBar"
import "ui/LeftScreen"

//import "ui/CalendarPopup"

// <<-- New import
Window {
    width: 900
    height: 450
    title: qsTr("Tesla")
    visible: true

    LeftScreen {
        id: leftScreen
    }

    BottomBar {
        id: bottomBar
        Component.onCompleted: {
            bottomBar.rightIcons.calendarClicked.connect(calendarPopup.open)
        }
    }

    //    CalendarPopup {
    //        id: calendarPopup
    //    }
    Component.onCompleted: {
        // Connect signal once UI is ready
        bottomBar.rightIcons.children[1].MouseArea.onClicked = function () {
            console.log("Calendar icon clicked - showing popup")
            calendarPopup.open()
        }
    }
}
