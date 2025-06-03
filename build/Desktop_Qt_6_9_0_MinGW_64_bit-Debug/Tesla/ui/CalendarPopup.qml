// File: ui/CalendarPopup.qml
import QtQuick
import QtQuick.Controls

Popup {
  id: calendarPopup
  width: 300
  height: 300
  modal: true
  focus: true
  dim: true
  closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

  background: Rectangle {
    color: "#1e1e1e"
    radius: 10
  }

  Column {
    anchors.centerIn: parent
    spacing: 10

    Text {
      text: "Select Date"
      color: "white"
      font.pixelSize: 18
      horizontalAlignment: Text.AlignHCenter
      width: parent.width
    }

    Calendar {
      id: calendarControl
      //width: 280
      //height: 250
    }
  }
}
