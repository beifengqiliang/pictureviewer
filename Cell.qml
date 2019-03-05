import QtQuick 2.0

//Item是QML中最基本的可视元素，通常用作其他元素的容器
Item {
    id: container
    //cellColor属性可以从组件外部访问 ，允许实例化具有不同颜色的单元格。它是组成单元格的矩形的现有颜色属性的别名。
    property alias cellColor: rectangle.color
    //信号：点击，更改主QML文件中的文本颜色
    signal clicked(color cellColor)

    width: 40; height: 25

    Rectangle {
        id: rectangle
        //边框颜色为白色
        border.color: "white"
        //anchors.fill属性是设置元素大小的便捷方式。在这种情况下，矩形的大小与其父级相同
        anchors.fill: parent
    }

    //MouseArea使您可以对鼠标事件做出反应，例如单击，悬停等。
    MouseArea {
        anchors.fill: parent
        //当报告MouseArea 单击信号时，将发出Cell的单击信号。
        onClicked: container.clicked(container.cellColor)
    }
}