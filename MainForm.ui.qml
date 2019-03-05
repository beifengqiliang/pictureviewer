/* import部分 */
import QtQuick 2.4
import QtQuick.controls 1.3
import QtQuick.Layouts 1.1

Item {
    width: 640
    height: 480

    /* 定义属性别名，为在main.qml中引用这三个按钮控件 */
    property alias button3: button3
    property alias button2: button2
    property alias button1: button1

    RowLayout {                   //行布局
        anchors.centerIn:parent   //在窗口中居中
        Button {                  //按钮控件
            id: button1
            text: qsTr("Press Me 1")
        } 
        Button {
            id: button2
            text: qsTr("Press Me 2")
        }
        Button {
            id: button3
            text: qsTr("Press Me 3")
        }
    }
}