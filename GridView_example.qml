import QtQuick 2.0

Rectangle {
    width: 240
    height: 300
    color: "white"
    
    GridView {
        anchors.fill: parent
        anchors.margins: 20

        clip: true
        model: 100
        delegate: numberDelegate

        // 单元宽度（cellWidth）与单元高度（cellHeight）
        cellWidth: 45
        cellHeight: 45  
    }

    Component {
        id: numberDelegate

        Rectangle {
            width: 40
            height: 40
            color: "lightGreen"

            Text {
                anchors.centerIn: parent
                font.pixelSize: 10
                text: index
            }
        }
    }
}