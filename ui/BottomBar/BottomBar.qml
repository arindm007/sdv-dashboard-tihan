
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning
import QtQuick.Layouts
Rectangle {
    id: bottomBar
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    height: parent.height / 12
    color: "#141414"

  /*  Image {
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

  Button {
        id: carSettingsButton
        width: 36
        height: 36
        anchors {
            left: parent.left
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }

        background: Rectangle {
            color: "transparent"  // Make it transparent or set a color
            radius: 5
        }

        contentItem: Image {
            source: "qrc:/Tesla/assets/carIcon.png"
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            width: parent.width
            height: parent.height
        }

        onClicked: console.log("Car icon button clicked")
    }*/




    Rectangle {
        id: root
        width: 400
        height: 400

        ComboBox {
            id: control
            x: 50
            y: 50
            model: ["My Brackets 2021", "New Preset 22", "Super Br1", "New thingy", "Element of that list"]

            delegate: ItemDelegate {
                width: control.width - 20
                contentItem: Text {
                    text: modelData
                    color: "#787878"
                    font: control.font
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter

                    Button {
                        x: parent.width - 25
                        y: (parent.height - height) / 2
                        width: 30
                        height: 30
                        text: "\u26CC"
                        onClicked: { /* --Perform delete action here-- */ }
                    }
                }
                highlighted: control.highlightedIndex === index
            }

            indicator: Canvas {
                id: canvas
                x: control.width - width - control.rightPadding
                y: control.topPadding + (control.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"

                Connections {
                    target: control
                    function onPressedChanged() { canvas.requestPaint(); }
                }

                onPaint: {
                    context.reset();
                    context.moveTo(0, 0);
                    context.lineTo(width, 0);
                    context.lineTo(width / 2, height);
                    context.closePath();
                    context.fillStyle = control.pressed ? "#17a81a" : "#B4C8DA";
                    context.fill();
                }
            }

            contentItem: Text {
                leftPadding: 10
                rightPadding: control.indicator.width + control.spacing

                text: control.displayText
                font: control.font
                color: control.pressed ? "#17a81a" : "#787878"
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 250
                implicitHeight: 40
                border.color: control.pressed ? "#17a81a" : "#B4C8DA"
                border.width: control.visualFocus ? 2 : 1
                radius: 20
            }

            popup: Popup {
                y: control.height + 3
                width: control.width
                implicitHeight: contentItem.implicitHeight + 20
                padding: 10

                contentItem: ListView {
                    clip: true
                    implicitHeight: contentHeight
                    model: control.popup.visible ? control.delegateModel : null
                    currentIndex: control.highlightedIndex

                    ScrollIndicator.vertical: ScrollIndicator { }
                }

                background: Rectangle {
                    border.color: "#B4C8DA"
                    radius: 20
                }
            }
        }
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
