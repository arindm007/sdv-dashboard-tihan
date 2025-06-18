import QtQuick
import QtWebEngine 1.15

Rectangle {
    id: bottomBar
    property alias rightIcons: rightIcons
    signal requestOpenUrl(string url)

    property var chatBotPopup: null

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
        height: parent.height * 0.85
        fillMode: Image.PreserveAspectFit
        source: "qrc:/Tesla/assets/carIcon.png"
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: webView.url = "http://localhost:8000/index.html"
        }
    }

    Image {
        id: chatBotIcon
        source: "qrc:/Tesla/assets/support.png"
        anchors {
            left: carSettingsIcon.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: 50
            topMargin: 20
            bottomMargin: 20
        }
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
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height * 0.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/line.png"
    }

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

        onRequestOpenUrl: (url) => {
            bottomBar.requestOpenUrl(url)
        }
    }

    // ✅ Chatbot Component (Put this near bottom of Rectangle)
    Component {
        id: chatBotComponent
        ChatBotPopup {}
    }
}
