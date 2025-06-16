import QtQuick

Item {



    Image{
        id: separaterIcon
        anchors{
            left: moreItemsIcon.right
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: parent.height *.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:Tesla/assets/line.png"
    }



}
