import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning




Rectangle {
    id: rightScreen
    anchors {
        right: parent.right
        top: parent.top
        bottom: bottomBar.top
    }
    width: parent.width * 2/3
    height: parent.height - bottomBar.height
    color: "#141414"

    // Plugin {
    //     id: osmPlugin
    //     name: "osm"
    // }

    // // Map Component
    // Map {
    //     id: map
    //     anchors.fill: parent
    //     plugin: osmPlugin
    //     center: QtPositioning.coordinate(17.5947, 78.1230)
    //     zoomLevel: 14

    //     MapUrlTileLayer {
    //                 // Use if your Qt version supports it (Qt 6.5+)
    //                 url: "http://localhost:8080/tiles/{z}/{x}/{y}.png"
    //                 minimumZoomLevel: 0
    //                 maximumZoomLevel: 18
    //                 tileSize: 256
    //     }

    // }


    // Overlay Items
    Item {
        id: overlay
        anchors.fill: parent

        // Top-Left Icons and Text
        Row {
            id: topLeftRow
            anchors {
                left: parent.left
                top: parent.top
                margins: 10
            }
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
                font.pixelSize: 12
                font.bold: true
                color: "white"
                text: "11:58"
            }

            Text {
                id: temperatureDisplay
                font.pixelSize: 12
                font.bold: true
                color: "white"
                text: "27°C"
            }

            Text {
                id: profileDisplay
                font.pixelSize: 12
                font.bold: true
                color: "white"
                text: "Vishnu-Alamuri"
            }
        }

        // Navigation Search Box
        Navigation {
            id: navSearchBox
            width: parent.width * 1 / 3
            height: parent.height * 1 / 16
            anchors {
                left: parent.left
                top: topLeftRow.bottom
                topMargin: 10
                leftMargin: 700
            }
            z: 1
        }
    }
}
