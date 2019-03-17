import QtQuick 2.0
/* 
*  在下面的例子中，一个repeater元素创建了10个子项，子项的数量由model属性控制。
*  对于每个子项Rectangle包含了一个Text元素，你可以将text属性设置为index的值，
*  因此可以看到子项的编号是0~9
*/

Column {
    spacing: 2

    Repeater {
        model: 10

        Rectangle {
            width: 100
            height: 20
            radius: 3
            color: "lightBlue"

            Text {
                anchors.centerIn: parent
                text: index
            }
        }
    }
}