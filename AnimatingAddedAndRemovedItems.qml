import QtQuick 2.0

/* 动画添加与移除元素 */

Rectangle {
    width: 480
    height: 300
    color: "white"

    ListModel {
        id: theModel
        ListElement { number: 0 }
        ListElement { number: 1 }
        ListElement { number: 2 }
        ListElement { number: 3 }
        ListElement { number: 4 }
        ListElement { number: 5 }
        ListElement { number: 6 }
        ListElement { number: 7 }
        ListElement { number: 8 }
        ListElement { number: 9 }
    }
    
    // 点击"Add item!"增加一个新的元素
    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20
        height: 40
        color: "darkGreen"
        
        Text {
            anchors.centerIn: parent
            text: "Add item!"
        }
        
        MouseArea {
            anchors.fill: parent
            // 调用模型的append方法来添加一个新的元素，append触发视图创建一个新的代理
            onClicked: {theModel.append({"number": ++parent.count});
        }
    }
    
    property int count: 9
}

GridView {
    anchors.fill: parent
    anchors.margins: 20
    anchors.bottomMargin: 80
    // 激活裁剪功能
    clip: true

    model: theModel
    delegate: numberDelegate

    cellWidth: 45
    cellHeight: 45
}

Component {
    id: numberDelegate
    
    Rectangle {
        id: wrapper
        width: 40
        height: 40
        color: "lightGreen"

        Text {
            anchors.centerIn: parent
            font.pixelSize: 10
            text: number
        }

        // 点击矩形元素，则移除该元素
        MouseArea {
            anchors.fill: parent

            onClicked: {
                if (!wrapper.GridView.delayRemove)
                   theModel.remove(index);
                }
            }
            
            // 发送GridView.onRemove信号，该SequentialAnimation队列动画与这个信号连接绑定
            GridView.onRemove: SequentialAnimation {
                // PropertyAction元素需要在动画前设置GridView.delayRemove属性为true，并在动画后设置为false。这样确保了动画在代理项移除前完成
                PropertyAction { target: wrapper; property: "GridView.delayRemove"; value: true }
                NumberAnimation { target: wrapper; property: "scale"; to: 0; duration: 250; easing.type: Easing.InOutQuad }
                PropertyAction { target: wrapper; property: "GridView.delayRemove"; value: false }
            }
            
            // 发送GridView.onAdd信号，该SequentialAnimation队列动画与这个信号连接绑定
            GridView.onAdd: SequentialAnimation {
                NumberAnimation { target: wrapper; property: "scale"; from: 0; to: 1; duration: 250; easing.type: Easing.InOutQuad }
            }
        }
    }
}