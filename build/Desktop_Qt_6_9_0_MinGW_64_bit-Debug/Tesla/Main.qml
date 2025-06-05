import QtQuick
import QtQuick.Window

import "ui/BottomBar"
import "ui/LeftScreen" // Only LeftScreen remains


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
    }
}
