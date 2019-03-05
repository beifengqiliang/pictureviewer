import QtQuick 2.0
import QtQuick.Controls 1.1
 
Rectangle {
    width: 320;
    height: 240;

    //定义MouseArea元素处理鼠标事件
    MouseArea {
        //事件响应区充满整个矩形
        anchors.fill: parent;
        //MouseArea所能接受的鼠标按键:左键和右键；另外，可取的值还有鼠标中键（Qt.MiddleButton）
        acceptedButtons: Qt.LeftButton | Qt.RightButton;
        //处理鼠标事件的代码
        onClicked: {
            //mouse.button为MouseArea信号所包含的鼠标事件参数，
            //mouse为鼠标事件对象，其button属性获取按下的按键
            if(mouse.button == Qt.RightButton){
                Qt.quit();
            }
            //通过mouse的x和y属性获取鼠标的当前位置，并由此设置矩形的颜色
            else if(mouse.button == Qt.LeftButton){
                color = Qt.rgba((mouse.x % 255) / 255.0 , (mouse.y % 255) / 255.0, 0.6, 1.0);
            }
        }

        //双击设置颜色为灰色
        onDoubleClicked: {
            color = "gray";
        }
    }
}
