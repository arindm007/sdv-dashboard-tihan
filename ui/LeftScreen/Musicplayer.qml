import QtQuick

Rectangle {
    id: musicPlayer
    width: carRender.width * 1.5   // increase size by 50%

    Image {
         id: dummyBelowBus
         fillMode: Image.PreserveAspectFit
         source: "qrc:Tesla/assets/dummy.png"
     }
}
