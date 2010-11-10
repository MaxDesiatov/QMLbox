import Qt 4.7
import CursorArea 0.1

Rectangle {
    id: rectangle1
    width: 200
    height: 323

    TextBox {
        id: txtEdit
        width: 100
        height: 20
        anchors.horizontalCenter: parent.horizontalCenter
        text: "13"
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: txtEdit.text
    }

    Rectangle {
        id: cursorRect
        color: "red"
        width:  150
        height: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.bottom
        CursorArea {
            cursor: parseInt(txtEdit.text)
            width: parent.width
            height: parent.height
        }
    }
}
