import QtQuick 2.0
import QtQuick.Controls 1.1
 
Rectangle {
    width: 320;
    height: 480;
    color: "gray";
    
    //如果某个QML对象要响应按键事件，首先必须设置其focus属性为true，因为这个属性默认为false
    focus: true;

    //Keys有三个属性：enabled、forwardTo、prioriry

    //enabled属性默认为true，为false时不能响应按键事件，影响的只是当前QML对象
    Keys.enabled: true;
    //按下Esc键退出程序
    Keys.onEscapePressed: {
        Qt.quit();
    }
    //forwardTo是个列表属性list<Object>，设置按键事件传递的顺序。
    //某个QML对象在这个列表属性中时，即使没有设置focus为true也能响应按键事件;
    //如果某个按键事件被列表属性中前面的Item处理了，后面的Item就不会再收到这个按键信号
    Keys.forwardTo: [moveText, likeQt];
    
    //补充说明：priority属性用来设置处理按键事件时的优先级，默认是Keys.BeforeItem.
    //也就是说优先处理Keys附加属性的按键事件，然后才是Item本身的按键事件，
    //但Keys已经处理过的按键事件就不会再传递到当前Item了，反之Keys.afterItem亦然
    Text {
        id: moveText;
        x: 20;
        y: 20;
        width: 200;
        height: 30;
        text: "Moving Text";
        color: "blue";
        font { bold: true; pixelSize: 24;}
        Keys.enabled: true;

        //处理键盘事件的代码
        Keys.onPressed: {
            switch(event.key){
                case Qt.Key_Left://方向键向左
                x -= 10;
                break;
                case Qt.Key_Right://方向键向右
                x += 10;
                break;
                case Qt.Key_Down://方向键向下
                y += 10;
                break;
                case Qt.Key_Up://方向键向上
                y -= 10;
                break;
                default:
                return;
            }
            event.accepted = true;
        }
    }

    CheckBox {
        id: likeQt;
        text: "Like Qt Quick";
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 10;
        z: 1;
    }
}
