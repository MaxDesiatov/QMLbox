import Qt 4.7
import CursorArea 0.1

Rectangle {
    id: rectangle1
    width: 800
    height: 600

    TextBox {
        id: txtEdit
        width: 100
        height: 20
        anchors.horizontalCenter: parent.horizontalCenter
        text: "млваотмолт"
        validator: IntValidator{}
    }

    Button {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
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

    TableView {
        id: table
        colHeight: 75
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
}
