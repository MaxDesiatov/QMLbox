import Qt 4.7
import CursorArea 1.0

Rectangle {
    id: rectangle1
    width: 200
    height: 323
    Text {
        id: hello
        text: "blahblah"
        anchors.centerIn: parent
    }

    CursorArea {
        id: cur
        cursor: 2
        y: 85
        anchors.horizontalCenter: parent.horizontalCenter
        width: button1.width
        height: button1.height
        Button {
            id: button1
            text: cur.cursor
            onClicked: hello.text += "z"
        }
    }

    CursorArea {
        id: cur2
        cursor: 3
        y: 221
        anchors.horizontalCenter: parent.horizontalCenter
        width: button2.width
        height: button2.height
        Button {
            id: button2
            text: cur2.cursor
            onClicked: hello.text = hello.text.substring(0, hello.text.length - 1)
        }
    }
}
