import QtQuick 1.0
import WheelArea 0.1

Item {
    id: scrollBar
    width: 20
    property real position: 0
    property real filled: 1
    property real step: filled / 3
    property real bigStep: filled

    Button {
        id: upArrow
        text: "▲"
        anchors.top: parent.top
        width: parent.width
        height: 15
        pointSize: 8
        Timer {
            id: timerUp
            running: false
            triggeredOnStart: true
            interval: 100
            repeat: true
            onTriggered: {
                var tmp = bar.y - barMouseArea.drag.maximumY * step
                bar.y = tmp < barMouseArea.drag.minimumY ? barMouseArea.drag.minimumY : tmp
            }
        }
        onPressed: timerUp.start()
        onReleased: timerUp.stop()
    }

    Rectangle {
        id: barArea
        color: "lightgrey"
        width: parent.width
        height: parent.height - upArrow.height - downArrow.height
        anchors.centerIn: parent

        MouseArea {
            width: scrollBar.width
            height: bar.y
            y: 0

            Timer {
                id: timerUpFree
                running: false
                triggeredOnStart: true
                interval: 100
                repeat: true
                onTriggered: {
                    var tmp = bar.y - barMouseArea.drag.maximumY * bigStep
                    bar.y = tmp < barMouseArea.drag.minimumY ? barMouseArea.drag.minimumY : tmp
                }
            }
            onPressed: timerUpFree.start()
            onReleased: timerUpFree.stop()
        }

        Button {
            id: bar
            width: scrollBar.width
            height: barArea.height * filled
            anchors.horizontalCenter: parent.horizontalCenter
            text: ""
            y: 0
            onYChanged: position = 1 - (barMouseArea.drag.maximumY - y) / barMouseArea.drag.maximumY

            Behavior on y { PropertyAnimation { duration: 100 } }

            MouseArea {
                id: barMouseArea
                anchors.fill: parent
                drag.target: bar
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: barArea.height - height
            }
        }

        MouseArea {
            width: scrollBar.width
            height: barArea.height
            y: bar.y + bar.height

            Timer {
                id: timerDownFree
                running: false
                triggeredOnStart: true
                interval: 100
                repeat: true
                onTriggered: {
                    var tmp = bar.y + barMouseArea.drag.maximumY * bigStep
                    bar.y = tmp > barMouseArea.drag.maximumY ? barMouseArea.drag.maximumY : tmp
                }
            }
            onPressed: timerDownFree.start()
            onReleased: timerDownFree.stop()
        }
    }

    Button {
        id: downArrow
        text: "▼"
        anchors.bottom: parent.bottom
        width: parent.width
        height: 15
        pointSize: 8

        Timer {
            id: timerDown
            running: false
            triggeredOnStart: true
            interval: 100
            repeat: true
            onTriggered: {
                var tmp = bar.y + barMouseArea.drag.maximumY * step
                bar.y = tmp > barMouseArea.drag.maximumY ? barMouseArea.drag.maximumY : tmp
            }
        }
        onPressed: timerDown.start()
        onReleased: timerDown.stop()
    }

    WheelArea {
        id: wheel
        anchors.fill: parent
        onVerticalWheel: {
            var tmp = bar.y - delta * step
            if (tmp > barMouseArea.drag.maximumY)
                bar.y = barMouseArea.drag.maximumY
            else if (tmp < barMouseArea.drag.minimumY)
                bar.y = barMouseArea.drag.minimumY
            else
                bar.y = tmp
        }
    }
}
