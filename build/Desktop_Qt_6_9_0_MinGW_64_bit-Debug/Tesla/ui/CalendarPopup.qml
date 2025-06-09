// File: ui/CustomCalendar.qml
import QtQuick 6.4
import QtQuick.Controls 6.4
import QtQuick.Layouts 6.4

Item {
  id: customCalendar
  width: 280
  height: 300

  property int currentMonth: new Date().getMonth()
  property int currentYear: new Date().getFullYear()

  signal dateSelected(date selectedDate)

  Column {
    anchors.fill: parent
    spacing: 10

    Row {
      spacing: 10
      anchors.horizontalCenter: parent.horizontalCenter

      Button {
        text: "<"
        onClicked: {
          if (currentMonth === 0) {
            currentMonth = 11
            currentYear -= 1
          } else {
            currentMonth -= 1
          }
        }
      }

      Text {
        text: Qt.formatDate(new Date(currentYear, currentMonth), "MMMM yyyy")
        font.pixelSize: 16
        color: "white"
      }

      Button {
        text: ">"
        onClicked: {
          if (currentMonth === 11) {
            currentMonth = 0
            currentYear += 1
          } else {
            currentMonth += 1
          }
        }
      }
    }

    GridLayout {
      columns: 7
      anchors.horizontalCenter: parent.horizontalCenter
      rowSpacing: 4
      columnSpacing: 4

      Repeater {
        model: ["S", "M", "T", "W", "T", "F", "S"]
        delegate: Text {
          text: modelData
          font.bold: true
          color: "white"
          horizontalAlignment: Text.AlignHCenter
          Layout.alignment: Qt.AlignHCenter
        }
      }

      Repeater {
        id: daysRepeater
        model: 42
        delegate: Rectangle {
          width: 30
          height: 30
          color: isCurrentMonth ? "#2e2e2e" : "transparent"
          border.color: "gray"
          radius: 5

          property int day: index - firstDay + 1
          property bool isCurrentMonth: day > 0 && day <= daysInMonth

          Text {
            anchors.centerIn: parent
            text: isCurrentMonth ? day : ""
            color: isCurrentMonth ? "white" : "transparent"
          }

          MouseArea {
            anchors.fill: parent
            enabled: isCurrentMonth
            onClicked: {
              const selected = new Date(currentYear, currentMonth, day)
              customCalendar.dateSelected(selected)
            }
          }
        }

        property int daysInMonth: {
          let nextMonth = new Date(currentYear, currentMonth + 1, 0)
          return nextMonth.getDate()
        }

        property int firstDay: {
          let first = new Date(currentYear, currentMonth, 1)
          return first.getDay()
        }
      }
    }
  }

  Rectangle {
    anchors.fill: parent
    color: "#1e1e1e"
    z: -1
    radius: 10
  }
}
