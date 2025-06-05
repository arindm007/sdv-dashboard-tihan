import QtQuick

Item {
    // Base properties for all icons
    property color hoverColor: "#0099FF"   // Light blue tint on hover
    property real iconOpacity: 0.8          // Default icon opacity
    property real iconHoverOpacity: 1.0     // Opacity when hovered

    function applyHoverEffects(mouseArea, image) {
        mouseArea.hoverEnabled = true
        mouseArea.cursorShape = Qt.PointingHandCursor

        mouseArea.onEntered.connect(() => {
            image.opacity = iconHoverOpacity
            // Optional: add a subtle color overlay using a shader or ColorOverlay element if needed
        })
        mouseArea.onExited.connect(() => {
            image.opacity = iconOpacity
        })
    }

    // Phone Call Icon
    Item {
        anchors {
            right: recorderIcon.left
            verticalCenter: parent.verticalCenter
            rightMargin: 20
        }
        height: parent.height * 0.5
        width: height

        Image {
            id: callIcon
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:Tesla/assets/phone-call.png"
            opacity: iconOpacity
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onEntered: callIcon.opacity = iconHoverOpacity
            onExited: callIcon.opacity = iconOpacity

            onClicked: {
                // Add your click logic here
                console.log("Call icon clicked")
            }
        }
    }

    // Recorder Icon
    Item {
        id: recorderIcon
        anchors {
            right: cameraLensIcon.left
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.5
        width: height

        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:Tesla/assets/audio.png"
            opacity: iconOpacity
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onEntered: parent.children[0].opacity = iconHoverOpacity
            onExited: parent.children[0].opacity = iconOpacity

            onClicked: {
                console.log("Recorder icon clicked")
            }
        }
    }

    // Camera Lens Icon
    Item {
        id: cameraLensIcon
        anchors {
            right: moreItemsIcon.left
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.5
        width: height

        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:Tesla/assets/camera-lens.png"
            opacity: iconOpacity
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onEntered: parent.children[0].opacity = iconHoverOpacity
            onExited: parent.children[0].opacity = iconOpacity

            onClicked: {
                console.log("Camera lens icon clicked")
            }
        }
    }

    // More Items Icon
    Item {
        id: moreItemsIcon
        anchors {
            right: parent.right
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * 0.5
        width: height

        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:Tesla/assets/more.png"
            opacity: iconOpacity
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onEntered: parent.children[0].opacity = iconHoverOpacity
            onExited: parent.children[0].opacity = iconOpacity

            onClicked: {
                console.log("More items icon clicked")
            }
        }
    }
}
