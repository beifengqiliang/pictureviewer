/* import部分 */
import QtQuick 2.7
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialog 1.3

/* 对象声明 */
ApplicationWindow {       //主应用窗口
    title: qsTr("Hello World")
	width: 640
	height: 480
	visible: true
	menuBar: MenuBar {    //标准的UI元素以设置“组件类属性”的方式添加到ApplicationWindow中
	    Menu {
		    title: qsTr("&File")
			MenuItem {    //菜单项
			   text: qsTr("&Open")
			   onTriggered:messageDialog.show(qsTr("Open action triggered"));
			}
			MenuItem {    //菜单项
			   text: qsTr("&Exit")
			   onTriggered: Qt.quit();
			}
		}
	}
	MainForm {             //主窗体
	    anchors.fill: parent
	    button1.onClicked: messageDialog.show(qsTr("Button 1 pressed"))
        button2.onClicked: messageDialog.show(qsTr("Button 2 pressed"))
        button3.onClicked: messageDialog.show(qsTr("Button 3 pressed"))
	}
	MessageDialog {         //其他组件
	    id: messageDialog
		title: qsTr("May I have your attention, please? ")
		function show(caption) {
		    messageDialog.text = caption;
			messageDialog.open();
		}
	}
}