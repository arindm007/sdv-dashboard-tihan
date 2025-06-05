import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning
import QtQuick.Layouts

Rectangle {
    id: leftScreen
    anchors {
        left: parent.left
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }
    color: "#141414"

    // Car render image
    Image {
        id: carRender
        anchors.centerIn: parent
        width: parent.width * 0.25
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/Bus.png"
    }


    // Buttons under car image
    Rectangle {
        id: dummyBelowBus
        anchors.top: carRender.bottom
        anchors.horizontalCenter: carRender.horizontalCenter
        anchors.topMargin: 100
        width: carRender.width * 1.5
        height: width * 0.5
        color: "dark gray"
        border.color: "black"
        border.width: 2



        Rectangle {
            width: 40      // Increased to allow space for image + text
            height: 30      // Decreased height to reduce size
            color: "darkgray"

            anchors {
                top: parent.top
                topMargin: 10
            }

            Row {
                spacing: 4
                anchors.fill: parent
                anchors.margins: 2

                Image {
                    id: albumArt
                    source: "qrc:/Tesla/assets/song_icon.png"
                    width: 10
                    height: 20
                    fillMode: Image.PreserveAspectFit
                }

                Column {
                    spacing: 1

                    Text {
                        text: "Vampire"
                        font.bold: true
                        font.pointSize: 10
                        color: "black"
                        elide: Text.ElideRight
                    }

                    Text {
                        text: "Olivia Rodrigo"
                        font.pointSize: 8
                        color: "gray"
                        elide: Text.ElideRight
                    }
                }
            }
        }




        // Grouping the buttons
        Row {
            id: buttonGroup // Grouping buttons into a single object
            spacing: 10
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.left: parent.left // Center the buttons
            anchors.leftMargin: 20
            anchors.top: parent.top // **Changed to anchor to the top of the rectangle**
            anchors.topMargin: 20 //

            height: 50 // Set a fixed height for the row

            Button {
                anchors {

                    top: parent.top        // 👈 This is required
                       topMargin: 90         // 👈 Now this will move it down


                 }
                width: 32 // Reduced width
                height: 32 // Reduced height
                background: Rectangle { color: "black"; radius: 5 }
                contentItem: Image {
                    source: "qrc:Tesla/assets/prev.png"
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    width: 24 // Adjusted size for the image
                    height: 24 // Adjusted size for the image
                }
                onClicked: console.log("Previous clicked")
            }

            Button {
                anchors {

                    top: parent.top        // 👈 This is required
                       topMargin: 90         // 👈 Now this will move it down


                 }
                width: 32 // Reduced width
                height: 32 // Reduced height

                background: Rectangle { color: "black"; radius: 5 }
               contentItem: Image {
                    source: "qrc:Tesla/assets/play.png"
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    width: 24 // Adjusted size for the image
                    height: 24 // Adjusted size for the image
                }

                onClicked: console.log("Pause clicked")
            }

            Button {
                anchors {

                    top: parent.top        // 👈 This is required
                       topMargin: 90         // 👈 Now this will move it down


                 }
                width: 32 // Reduced width
                height: 32 // Reduced height
                background: Rectangle { color: "black"; radius: 5 }



                contentItem: Image {
                    source: "qrc:Tesla/assets/next.png"
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    width: 24 // Adjusted size for the image
                    height: 24 // Adjusted size for the image
                }
                onClicked: console.log("Next clicked")
            }
            Button {
                anchors {
                    top: parent.top
                    topMargin: 90
                }
                width: 32
                height: 32

                background: Rectangle {
                    color: "white"
                    radius: 5
                    border.color: "black"     // Add black border
                    border.width: 5         // Set border thickness to 1
                }

                contentItem: Image {
                    source: "qrc:Tesla/assets/search.png"
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    width: 24
                    height: 24
                }

                onClicked: console.log("Search clicked")
            }


        }



        Rectangle {
            width: 1      // Thin vertical line
            height: 350    // Height of the line
            color: "white" // Line color

            // Optional positioning
            anchors.centerIn: parent
        }




        Rectangle {
            id: innerRectangle
            width: 200
            height: 120 // Increased height to accommodate new blue rectangle
            color: "darkgrey"
            radius: 5
            visible: true

            anchors {
                top: parent.top
                topMargin: 10
                left: parent.left
                leftMargin: 400
            }

            // Existing Navigation Button
            Button {
                id: navigationButton
                width: parent.width * 0.9
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 5

                background: Rectangle {
                    color: "darkgrey"
                    radius: 5
                }

                contentItem: Row {
                    spacing: 10
                    anchors.centerIn: parent

                    Image {
                        source: "qrc:/Tesla/assets/navi.png"
                        width: 24
                        height: 24
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        text: "Navigation"
                        color: "white"
                        font.pixelSize: 16
                    }
                }

                onClicked: console.log("Navigation button clicked")
            }

            // New Blue Rectangle with 3 Buttons
            Rectangle {
                width: parent.width * 0.95
                height: 50
                color: "dark grey"
                radius: 4
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -20


                Row {
                    spacing: 6
                    anchors.centerIn: parent

                    // Hostel Circle Button
                    Button {
                        width: 50
                        height: 40
                        background: Rectangle {
                            color: "white"
                            radius: 5
                            border.color: "black"
                            border.width: 5
                        }

                        contentItem: Text {
                            text: "Hostel"
                            font.pixelSize: 10
                            color: "black"
                            anchors.centerIn: parent
                            wrapMode: Text.WordWrap
                        }
                        onClicked: console.log("Hostel Circle clicked")
                    }

                    // Main Gate Button
                    Button {
                        width: 50
                        height: 40
                        background: Rectangle {
                            color: "white"
                            radius: 5
                            border.color: "black"
                            border.width: 5
                        }

                        contentItem: Text {
                            text: "Main Gate"
                            font.pixelSize: 10
                            color: "black"
                            anchors.centerIn: parent
                            wrapMode: Text.WordWrap
                        }
                        onClicked: console.log("Main Gate clicked")
                    }

                    // Test Bed Button
                    Button {
                        width: 50
                        height: 40
                        background: Rectangle {
                            color: "white"
                            radius: 5
                            border.color: "black"
                            border.width: 5
                        }

                        contentItem: Text {
                            text: "Test Bed"
                            font.pixelSize: 10
                            color: "black"
                            anchors.centerIn: parent
                            wrapMode: Text.WordWrap
                        }
                        onClicked: console.log("Test Bed clicked")
                    }
                }
            }
        }

}





    Image {
        id: battery
        anchors { top: parent.top; right: parent.right }
        width: parent.width / 12
        height: parent.height / 12
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/battery1.png"
    }

    Rectangle {
        id: percentageRect
        anchors { top: battery.top; bottom: battery.bottom; right: battery.left }
        width: parent.width * 0.05
        color: "#141414"

        Text {
            id: batteryPercentage
            anchors.verticalCenter: parent.verticalCenter
            text: "50%"
            color: "white"
            font.pixelSize: 18
        }
    }

    IndicatorBar { id: indicatorBar }

    Image {
        id: seatBealtWarning
        anchors { bottom: parent.bottom; left: parent.left; leftMargin: 30; bottomMargin: 10 }
        width: parent.width / 24
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/warning.png"
    }

    Text {
        id: warningText
        anchors {
            left: seatBealtWarning.right
            bottom: seatBealtWarning.bottom
            leftMargin: 12
            verticalCenter: seatBealtWarning.verticalCenter
        }
        text: "Fasten your seatbelt!"
        font.pixelSize: 18
        font.bold: true
        color: "#8B8B88"
        verticalAlignment: Text.AlignVCenter
    }

    Item {
        id: overlay
        anchors.fill: parent

        Row {
            id: topLeftRow
            anchors { left: parent.left; top: parent.top; margins: 10 }
            spacing: 40
            z: 1

            Image {
                id: carLocked
                width: parent.width / 40
                fillMode: Image.PreserveAspectFit
                source: "qrc:Tesla/assets/lock.png"
            }

            Text {
                id: dateTimeDisplay
                font.pixelSize: 18
                font.bold: true
                color: "white"
                text: "11:58"
            }

            Text {
                id: temperatureDisplay
                font.pixelSize: 18
                font.bold: true
                color: "white"
                text: "27°C"
            }

            Text {
                id: profileDisplay
                font.pixelSize: 18
                font.bold: true
                color: "white"
                text: "Vishnu-Alamuri"
            }
        }
    }
}
