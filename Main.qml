import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtWebEngine 1.15

import "ui/BottomBar"
import "ui/LeftScreen"
import "ui"

Window {
    id: root
    width: 900
    height: 450
    title: qsTr("Tesla")
    visible: true

    LeftScreen {
        id: leftScreen
    }

    BottomBar {
        id: bottomBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        onRequestOpenUrl: (url) => {
            webView.url = url
            webView.visible = true
        }
    }

    WebEngineView {
        id: webView
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: bottomBar.top // ⬅️ this avoids covering the bottom bar
        }
        // visible: false
        url: "http://localhost:8000/index.html"
        z: 10
    }

    WebEngineView {
        id: map
        width: 370    // width of the small rectangle
        height: 600   // height of the small rectangle
        anchors.top: webView.top
        anchors.right: webView.right
        anchors.margins: 10  // optional margin from top-right corner
        url: "http://127.0.0.1:5000/"
        z: 11  // makes sure it's above webView
        clip: true
        visible: true
        backgroundColor: "transparent"
    }

    Rectangle {
        anchors.fill: map
        color: "transparent"
        // border.width: 2
        radius: 10
        z: 12  // higher than map so border is on top
        visible: map.visible  // optional: hides border when map is hidden
    }


    // Button {
    //     id: closeButton
    //     text: "Close"
    //     visible: webView.visible
    //     z: 11
    //     anchors.top: parent.top
    //     anchors.right: parent.right
    //     anchors.margins: 10

    //     onClicked: {
    //         webView.visible = false
    //         webView.url = ""
    //     }
    // }
}
