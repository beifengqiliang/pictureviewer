import QtQuick 2.0

/* -----链表视图ListView----- */

Rectangle {
    width: 200
    height: 300
    color: "white"
    
    ListView {
        anchors.fill: parent
        anchors.margins: 20

        // ListView默认为垂直方向(ListView.Vertical)，现设置为水平方向
        orientation: ListView.Horizontal
        // 水平链表视图默认的元素顺序方向是由左到右
        // 可以通过设置layoutDirection属性来控制元素顺序方向，它可以设置为Qt.LeftToRight或者Qt.RightToLeft
        layoutDirection: Qt.RightToLeft

        // ListView通过设置clip属性为true，来激活裁剪功能
        clip: true
        model: 100
        delegate: numberDelegate
        spacing: 5

        // boundsBehavior控制视图末尾的行为，
        // (1)默认值为Flickable.DragAndOvershootBounds，视图可以通过它的边界线来拖拽和翻阅
        // boundsBehavior: Flickable.DragAndOvershootBounds
        // (2)可以将视图拖拽到它的边界线外，但是在边界线上翻阅将无效
        // boundsBehavior: Flickable.DragOverBounds
        // (3)视图将不再可以移动到它的边界线之外
        // boundsBehavior: Flickable.StopAtBounds

        // 使用snapMode属性可以限制一个视图内元素的停止位置
        // (1)默认行为下是ListView.NoSnap，允许视图内元素在任何位置停止
        // snapMode: ListView.NoSnap
        // (2)视图顶部将会与元素对象的顶部对齐排列
        // snapMode: ListView.SnapToItem
        // (3)当鼠标或者触摸释放时，视图将会停止在第一个可见的元素，这种模式对于浏览页面非常便利
        // snapMode: ListView.SnapOneItem //有bug，视图始终停止在第一个可见的元素

        // 设置高亮(有bug)，高亮停止在第一个可见的元素
        highlight: highlightComponent
        focus: true

        // 页眉和页脚
        header: headerComponent
        footer: footerComponent
    }

    Component {
        id: highlightComponent

        Item {
            width: ListView.view.width
            height: ListView.view.currentItem.height
            y: ListView.view.currentItem.y
            Behavior on y {
                SequentialAnimation {
                    PropertyAnimation { target: highlightRectangle; property: "opacity"; to: 0; duration: 200 }
                    NumberAnimation { duration: 1 }
                    PropertyAnimation { target: highlightRectangle; property: "opacity"; to: 1; duration: 200 }
                }
            }
            Rectangle {
                id: highlightRectangle
                anchors.fill: parent
                color: "lightGreen"
            }
        }
    }

    Component {
        id: headerComponent
        Rectangle {
            width: 40
            height: 20
            color: "yellow"
        }
    }

    Component {
        id: footerComponent
        Rectangle {
            width: 40
            height: 20
            color: "red"
        }
    }


    Component {
        id: numberDelegate
        
        Item {
            width: 40
            height: 40

            Text {
                anchors.centerIn: parent
                font.pixelSize: 10
                text: index
            }
        }
    }
}