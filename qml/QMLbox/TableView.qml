import QtQuick 1.0

Rectangle {
    property alias model: table.model
    border.width: 1
    ListView {
        id: table
        width: parent.width - verticalScrollBar.width
        height: parent.height
        interactive: false
        clip: true
        contentY: verticalScrollBar.position * (contentHeight - table.height)
        header: Row { Repeater { model: 5; delegate: Text { text: index } } }
        delegate: Row { property variant rowIndex: index; Repeater { model: 5; delegate: Text { text: rowIndex } } }
    }

    VerticalScrollBar {
        id: verticalScrollBar
        height: table.height
        anchors.left: table.right
        anchors.verticalCenter: table.verticalCenter
        filled: table.height / table.contentHeight
    }
}
