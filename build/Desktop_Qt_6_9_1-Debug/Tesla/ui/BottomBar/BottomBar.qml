import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtWebEngine 1.15

Rectangle {
    id: bottomBar
    property alias rightIcons: rightIcons
    signal requestOpenUrl(string url)

    property var chatBotPopup: null
    property var chatTeaser: null

    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }

    height: parent.height / 12
    color: "#141414"

    // Chatbot Popup
    Component {
        id: chatBotComponent
        ChatBotPopup {}
    }

    // Floating Chat Teaser (inline version)
    Component {
        id: chatTeaserComponent

        Rectangle {
            width: 300
            height: 100
            radius: 40
            color: "white"
            border.color: "#0abac5"
            border.width: 1
            z: 999

            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.bottomMargin: bottomBar.height + 20

            Row {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 12

                Image {
                    source: "qrc:/Tesla/assets/chatbot.png"
                    width: 72
                    height: 72
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                }

                Text {
                    text: "Need help? Tap to chat!"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#000"
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    chatTeaser.visible = false
                    if (!chatBotPopup) {
                        chatBotPopup = chatBotComponent.createObject(bottomBar)
                    }
                    chatBotPopup.open()
                }
            }
        }
    }


    // Timer to show teaser automatically after load
    Timer {
        interval: 4000
        running: true
        repeat: false
        onTriggered: {
            if (!chatTeaser) {
                chatTeaser = chatTeaserComponent.createObject(bottomBar)
            }
        }
    }

    // Left Car Icon
    Image {
        id: carSettingsIcon
        anchors.left: parent.left
        anchors.leftMargin: 30

        anchors.verticalCenter: parent.verticalCenter
        height: parent.height * 0.85
        fillMode: Image.PreserveAspectFit
        source: "qrc:/Tesla/assets/logo.png"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: webView.url = "http://localhost:8000/index.html"
        }
    }

    // Support (Chatbot) icon
    Image {
        id: chatBotIcon
        source: "qrc:/Tesla/assets/aibot.png"
        anchors.left: carSettingsIcon.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 50
        anchors.topMargin: 20
        anchors.bottomMargin: 20
        height: parent.height * 0.6
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (!chatBotPopup) {
                    chatBotPopup = chatBotComponent.createObject(bottomBar)
                }
                chatBotPopup.open()
            }
        }
    }

    HVACComponent {
        id: passengerHAC
        anchors.right: volumeController.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 100
    }

    VolumeController {
        id: volumeController
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    Image {
        id: separaterIcon
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height * 0.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/line.png"
    }

    LeftIcons {
        id: leftIcons
        anchors.right: separaterIcon.left
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height
    }

    RightIcons {
        id: rightIcons
        anchors.left: separaterIcon.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 20
        height: parent.height

        onRequestOpenUrl: (url) => {
            bottomBar.requestOpenUrl(url)
        }
    }
}
