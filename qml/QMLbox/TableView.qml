import QtQuick 1.0
import WheelArea 0.1

Item {
    property int count: 0
    clip: true
    Component.onCompleted: count = table.children.length
    onCountChanged: {
        var tmp = 0
        for (var i = 0; i < count; ++i)
            tmp += table.children[i].height
        table.height = tmp
    }

    function push(component, init) {
        var obj = component.createObject(table)
        init(obj)
        obj.y = table.height
        obj.state = "removed"
        obj.state = "added"
        constructor.start()
    }

    function pop() {
        if (count > 0)
        {
            table.children[count - 1].state = "removed"
            destructor.start()
        }
    }

    Timer {
        id: constructor
        running: false
        triggeredOnStart: false
        interval: 100
        repeat: false
        onTriggered: ++count
    }

    Timer {
        id: destructor
        running: false
        triggeredOnStart: false
        interval: 100
        repeat: false
        onTriggered: { table.children[count - 1].destroy(); --count }
    }

    Item {
        id: table
        width: parent.width - bar.width
        y: - (height - parent.height) * (bar.barY / bar.maximumY)
    }

    VerticalScrollBar {
        id: bar
        height: parent.height
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        filled: {
            var tmp = parent.height / table.height
            if (tmp < 0.05)
                return 0.05
            else if (tmp > 1)
                return 1
            else
                return tmp
        }
        opacity: filled < 1 ? 1 : 0
        Behavior on opacity { PropertyAnimation { duration: 200 } }
    }
}
