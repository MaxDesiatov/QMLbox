import QtQuick 1.0
import CursorArea 0.1

Rectangle {
    property alias text: textInput.text
    property alias validator: textInput.validator
    property real leftMargin: 5
    property real rightMargin: 5
    property real topMargin: 2
    property real bottomMargin: 2

    border.width: 1

    CursorArea {
        cursor: 4
        anchors.fill: parent
    }

    TextInput {
        id: textInput
        anchors.fill: parent
        anchors.leftMargin: leftMargin
        anchors.rightMargin: rightMargin
        anchors.bottomMargin: bottomMargin
        anchors.topMargin: topMargin
        selectByMouse: true
        Keys.onPressed: {
            if (event.key == Qt.Key_Backspace ||
                    event.key == Qt.Key_Delete ||
                    event.text != "") console.log(text)
        }
    }
}
