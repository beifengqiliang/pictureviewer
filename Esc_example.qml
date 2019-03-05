import QtQuick 2.0
 
//这个代码片段实现的功能非常简单：用户按下 Esc 键时退出应用
Item {
    width: 100; 
    height: 100;
 
    focus: true;
    Keys.enabled: false;
    Keys.onReturnPressed: console.log("Return key was pressed");
}
