import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: customCalendar
    width: 280
    height: 320

    property date today: new Date()
    property int year: today.getFullYear()
    property int month: today.getMonth()
    property alias selectedDate: selectedDateText.text

    signal dateSelected(string dateString)

    Rectangle {
        anchors.fill: parent
        color: "#f0f0f0"
        radius: 10
        border.color: "#ccc"
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10
//        padding: 10

        // Header: Month Year
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 10

            Button {
                text: "<"
                onClicked: {
                    if (month === 0) {
                        month = 11
                        year--
                    } else {
                        month--
                    }
                }
            }

            Text {
                text: Qt.formatDate(new Date(year, month), "MMMM yyyy")
                font.bold: true
                font.pointSize: 14
                horizontalAlignment: Text.AlignHCenter
            }

            Button {
                text: ">"
                onClicked: {
                    if (month === 11) {
                        month = 0
                        year++
                    } else {
                        month++
                    }
                }
            }
        }

        // Day Labels
        GridLayout {
            columns: 7
            Layout.fillWidth: true
            Layout.preferredHeight: 20

            Repeater {
                model: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                delegate: Text {
                    text: modelData
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }

        // Calendar Days
        GridLayout {
            id: daysGrid
            columns: 7
            Layout.fillWidth: true
            Layout.fillHeight: true

            property int startDay: new Date(year, month, 1).getDay()
            property int daysInMonth: new Date(year, month + 1, 0).getDate()

            Repeater {
                model: startDay + daysInMonth
                delegate: Item {
                    width: 30; height: 30

                    Rectangle {
                        anchors.fill: parent
                        color: {
                            let d = index - startDay + 1
                            let isToday = year === today.getFullYear() &&
                                          month === today.getMonth() &&
                                          d === today.getDate()
                            return (index < startDay) ? "transparent"
                                 : isToday ? "#0099FF"
                                 : "white"
                        }
                        border.color: "#ccc"
                        radius: 5
                        MouseArea {
                            anchors.fill: parent
                            enabled: index >= startDay
                            onClicked: {
                                let selected = new Date(year, month, index - startDay + 1)
                                selectedDateText.text = Qt.formatDate(selected, "yyyy-MM-dd")
                                customCalendar.dateSelected(selectedDateText.text)
                            }
                        }
                        Text {
                            anchors.centerIn: parent
                            text: index < startDay ? "" : (index - startDay + 1)
                            font.bold: index === today.getDate() && month === today.getMonth() ? true : false
                            color: index < startDay ? "#aaa" : "#000"
                        }
                    }
                }
            }
        }

        // Selected Date Display
        Text {
            id: selectedDateText
            text: ""
            visible: false
        }
    }
}
