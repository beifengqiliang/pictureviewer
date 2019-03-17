import QtQuick 2.0
/* 
*  使用一个JavaScript序列来替换整形变量model的值
*   
*/

Column {
    spacing: 2

    Repeater {
        model: ["Enterprise", "Colombia", "Challenger", "Discovery"]

        Rectangle {
            width: 100
            height: 20
            radius: 3
            color: "lightBlue"

            Text {
                anchors.centerIn: parent
                text: index + ": " + modelData
            }
        }
    }
}