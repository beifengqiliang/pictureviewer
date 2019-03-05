/*import部分*/
import QtQuick 2.0

/*对象声明*/
Rectangle {                     //根对象：Rectangle 
    id: page                    //对象标识符
    width: 500                  //属性（宽度）
    height: 200                 //属性（高度）
    color: "lightgray"          //以纯色（浅灰色）填充

    Text {                      //子对象：Text
        id: helloText           //对象标识符
        text: "Hello world!"    //文本
        y: 30                   //y方向的坐标
        anchors.horizontalCenter: page.horizontalCenter     //anchors.horizontalCenter起到布局作用
        font.pointSize: 24; font.bold: true                 //属性：字体大小；粗体

        MouseArea { id: mouseArea; anchors.fill: parent }

        //状态
        states: State {
            //首先，为文本元素创建一个新的down状态
            name: "down"
            //按MouseArea激活此新状态,释放它将停用该状态
            when: mouseArea.pressed == true
            //向下状态包括一组隐式属性：{文本：y属性值改为160，旋转：顺时针180度，颜色改为红色}
            PropertyChanges { target: helloText; y: 160; rotation: 180; color: "red" }
        }

        //转换:在两个状态之间添加一个转换，以便在这两个状态之间切换看起来平滑而美观
        transitions: Transition {
            //默认状态；向下状态
            from: ""; to: "down"
            //reversible属性设置为true，相当于两个转换：默认->向下,向下->默认。
            //若reversible属性设置为false，则只有一个转换：默认->向下。
            reversible: true
            //ParallelAnimation元素确保两种类型的动画（数字和颜色）同时开始
            ParallelAnimation {
                NumberAnimation { properties: "y,rotation"; duration: 500; easing.type: Easing.InOutQuad }
                ColorAnimation { duration: 500 }
            }
        }
    }

    //在主QML文件中，使用Cell组件创建颜色选择器
    Flow {
        id: colorPickers
        anchors.bottom: page.bottom       //底部定位在页面的底部
        anchors.bottomMargin: 4           //与底部边框的距离为4
        width: 280
        height: 130
        spacing: 4

        Cell { cellColor: "red"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "green"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "blue"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "yellow"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "steelblue"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "black"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "red"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "green"; onClicked: helloText.color = cellColor }
        Cell { cellColor: "blue"; onClicked: helloText.color = cellColor }
    }
}