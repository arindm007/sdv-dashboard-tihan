import QtQuick
import QtQuick.Window

import "ui/BottomBar"
import "ui/LeftScreen"
import "ui/RightScreen"

Window{
    width: 900
    height: 450
    title: qsTr("Tesla")
    visible: true

    RightScreen{
        id: rightScreen
    }

    LeftScreen{
        id: leftScreen
    }


    BottomBar{
        id: bottomBar
    }


}

