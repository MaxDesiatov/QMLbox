import Qt 4.7

Item {
    id: scrollBar
    width: 20
    property real position: 0
    property real filled: 1
    property real step: 0.1
//    onPositionChanged: bar.y = barArea.height * position
    Button {
        id: topArrow
        text: "▲"
        anchors.top: parent.top
        width: parent.width
        height: 15
        pointSize: 8
        onClicked: { position -= step; if (position < 0) position = 0 }
    }
    Rectangle {
        id: barArea
        color: "grey"
        width: parent.width
        height: parent.height - topArrow.height - bottomArrow.height
        anchors.centerIn: parent
        Button {
            id: bar
            width: scrollBar.width
            height: barArea.height * filled
            anchors.horizontalCenter: parent.horizontalCenter
            text: ""
            y: 0
            MouseArea {
                id: barMouseArea
                anchors.fill: parent
                drag.target: bar
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: barArea.height - height
            }
            onYChanged: position = 1 - (barMouseArea.drag.maximumY - y) / barMouseArea.drag.maximumY
        }
    }

    Button {
        id: bottomArrow
        text: "▼"
        anchors.bottom: parent.bottom
        width: parent.width
        height: 15
        pointSize: 8
        onClicked: { position += step; if (position > 1) position = 1 }
    }
}
