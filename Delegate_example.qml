import QtQuick 2.0

Rectangle {
    width: 120
    height: 300
    color: "white"
    
    ListView {
        anchors.fill: parent
        anchors.margins: 20
        
        clip: true
        model: 100
        delegate: numberDelegate
        
        spacing: 5
        focus: true
    }
    
    Component {
        id: numberDelegate
        
        Rectangle {
            width: ListView.view.width
            height: 40
            color: ListView.isCurrentItem ? "gray" : "lightGray"
            
            Text {
                anchors.centerIn: parent
                font.pixelSize: 10
                text: index
            }
        }
    }
}