import QtQuick 1.0
import CursorArea 0.1
import PushButton 0.1

Rectangle {
    id: rectangle1
    width: 800
    height: 600

    TextBox {
        id: txtEdit
        width: 100
        height: 20
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        text: "млваотмолт"
    }

    Component {
        id: myDelegate
        Rectangle {
            id: rect
            width: 100
            states : [
                State {
                    name: "removed"
                    PropertyChanges { target: rect; height: 0 }
                },
                State {
                    name: "added"
                    PropertyChanges { target: rect; height: 100 }
                }
            ]
            Behavior on height { PropertyAnimation { duration: 100 } }
        }
    }

    Button {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        text: txtEdit.text
        onClicked: table.push(myDelegate, function(obj) {
                                  obj.color = Qt.lighter("blue", 1 + table.count * 0.1)
                              })
    }

    PushButton {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        text: "blah"
        onClicked: text += "z"
    }

    Rectangle {
        id: cursorRect
        color: "yellow"
        width:  150
        height: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom


        CursorArea {
            cursor: parseInt(txtEdit.text)
            anchors.fill: parent
        }
        MouseArea {
            onClicked: table.pop()
            anchors.fill: parent
        }
        Text {
            anchors.centerIn: parent
            text: table.count
        }
    }

    TableView {
        id: table
        anchors.centerIn: parent
        width: 200
        height: 250
    }
}
