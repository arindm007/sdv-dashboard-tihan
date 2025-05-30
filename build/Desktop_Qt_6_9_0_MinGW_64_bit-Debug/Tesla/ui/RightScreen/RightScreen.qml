import QtQuick

Rectangle {
    id: navSearchBox
    radius: 5

    color: "#CBCECE"

    Image {
        id: searchIcon

        anchors {
            left: parent.left
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }

        height: parent.height * .45
        fillMode: Image.PreserveAspectFit

        source: "qrc:Tesla/assets/search.png"
    }

    Text {
        id: navigationPlaceHolder
        visible: navigationTextInput.text === ""
        color: "#585757"
        text: "Navigate"
        anchors {
            left: searchIcon.right
            verticalCenter: parent.verticalCenter
            leftMargin: 20
        }
    }

    TextInput {
        id: navigationTextInput
        clip: true
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            left: searchIcon.right
            leftMargin: 20
        }

        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 11
    }
}
