import QtQuick
import QtLocation
import QtPositioning

Rectangle{
    id: rightScreen
    anchors{
        right: parent.right
        top: parent.top
        bottom: bottomBar.top
    }
//        color: "orange"
    width: parent.width *2/3

    Plugin{
        id: mapPlugin
        name: "osm"
    }

    Map{
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(-1.28, 36.81) //Oslo
        zoomLevel: 14
        property geoCoordinate startCentroid

        PinchHandler {
                   id: pinch
                   target: null
                   onActiveChanged: if (active) {
                       map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
                   }
                   onScaleChanged: (delta) => {
                       map.zoomLevel += Math.log2(delta)
                       map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                   }
                   onRotationChanged: (delta) => {
                       map.bearing -= delta
                       map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                   }
                   grabPermissions: PointerHandler.TakeOverForbidden
               }

        WheelHandler {
                    id: wheel
                    // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
                    // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
                    // and we don't yet distinguish mice and trackpads on Wayland either
                    acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                                     ? PointerDevice.Mouse | PointerDevice.TouchPad
                                     : PointerDevice.Mouse
                    rotationScale: 1/120
                    property: "zoomLevel"
                }
                DragHandler {
                    id: drag
                    target: null
                    onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
                }
                Shortcut {
                    enabled: map.zoomLevel < map.maximumZoomLevel
                    sequence: StandardKey.ZoomIn
                    onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
                }
                Shortcut {
                    enabled: map.zoomLevel > map.minimumZoomLevel
                    sequence: StandardKey.ZoomOut
                    onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
                }
    }

    Image{
        id: carLocked
        anchors{
            left: parent.left
            top: parent.top
            margins: 10
        }
        width: parent.width/40
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/lock.png"
    }



//    MouseArea{
//        id: carLockedMA
//        anchors.fill: carLocked
//        onClicked: {
//            //Toggle the locked and the unlocked icons
//            if (carLocked.source === "qrc:Tesla/assets/lock.png" ){
//                carLocked.source = "qrc:Tesla/assets/unlock.png"
//            }
//            else{
//                carLocked.source = "qrc:Tesla/assets/lock.png"
//            }
//        }
//    }


    Text{
        id: dateTimeDisplay
        anchors{
            left: carLocked.right
            leftMargin: 40
            bottom: carLocked.bottom
        }
        font.pixelSize: 12
        font.bold: true
        color: "black"
        text: "11:58"
    }

    Text{
        id: temperatureDisplay
        anchors{
            left: dateTimeDisplay.right
            leftMargin: 40
            bottom: carLocked.bottom
        }
        font.pixelSize: 12
        font.bold: true
        color: "black"
        text: "27°C"
    }

    Text{
        id: profileDisplay
        anchors{
            left: temperatureDisplay.right
            leftMargin: 40
            bottom: carLocked.bottom
        }
        font.pixelSize: 12
        font.bold: true
        color: "black"
        text: "Gilbert"
    }

    Navigation{
        id: navSearchBox
        width: parent.width *1/3
        height: parent.height *1/12
        anchors{
            left: carLocked.left
            top: carLocked.bottom
            topMargin: 10
        }
    }
}

