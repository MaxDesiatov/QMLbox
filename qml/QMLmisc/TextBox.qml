import Qt 4.7
import CursorArea 0.1

Rectangle {
    property alias text: textInput.text

    border.width: 1

    CursorArea {
        cursor: 4
        width: parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    TextInput {
        id: textInput
        width: parent.width - 7
        height: parent.height - 7
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        selectByMouse: true
    }
}
