import Qt 4.7

Item {
    property alias colHeight: col.height
    Rectangle {
        id: table
        color:  "black"
        width: col.width + 2
        height: col.height + 2
        Column {
            id: col
            spacing: 1
            anchors.centerIn: parent
            clip: true
            Row {
                id: row
                spacing: 1
                Repeater {
                    model: 3
                    Rectangle {
                        width: 100; height: 20
                        color: "blue"
                        Text {
                            text: verticalScrollBar.position
                        }
                    }
                }
            }
            Repeater {
                model: 5
                Row {
                    spacing: 1
                    Repeater {
                        model: 3
                        Rectangle {
                            width: 100; height: 40
                            color: "yellow"
                        }
                    }
                }
            }
        }
    }

    VerticalScrollBar {
        id: verticalScrollBar
        height: table.height
        anchors.left: table.right
        anchors.verticalCenter: table.verticalCenter
        filled: 0.5
    }
}
