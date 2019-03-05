import QtQuick 2.0
import QtQuick.Controls 1.1
 
Rectangle {
    width: 320;
    height: 240;
    color: "gray";

    //计数保存在 QtObject 对象中
    QtObject{
        id: attrs;
        property int counter;
        Component.onCompleted:{
            //计数初始值为10
            attrs.counter = 10;
        }
    }
    
    Text {
        id: countShow;
        anchors.centerIn: parent;
        color: "blue";
        font.pixelSize: 40;
    }
    
    Timer {
        id: countDown;
        //interval 指定定时周期，单位是毫秒，默认值是 1000 毫秒
        interval: 1000;
        //repeat 设定定时器是周期性触发还是一次性触发，默认是一次性的
        repeat: true;
        //设置triggeredOnStart 属性，周期是 1 秒
        triggeredOnStart: true;
        //onTriggered 信号处理器
        onTriggered:{
            countShow.text = attrs.counter;
            attrs.counter -= 1;
            if(attrs.counter < 0)
            {
                countDown.stop();
                countShow.text = "Clap Now!";
            }
        }
    }
    
    Button {
        id: startButton;
        anchors.top: countShow.bottom;
        anchors.topMargin: 20;
        anchors.horizontalCenter: countShow.horizontalCenter;
        text: "Start";
        onClicked: {
            countDown.start();
        }
    }
}
