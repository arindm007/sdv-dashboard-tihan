import QtQuick
import QtQuick.Window
import QtQuick.Controls

import "ui/BottomBar"
import "ui/LeftScreen"
import "ui"

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
        // the alias lets us see rightIcons from here
    }
}
