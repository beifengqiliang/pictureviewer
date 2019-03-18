import QtQuick 2.0

/* 有时，链表的数据需要划分段。例如使用首字母来划分联系人，或者音乐。使用链表视图可以把平面列表按类别划分 */

Rectangle {
    width: 300
    height: 290
    color: "white"

    ListView {
        anchors.fill: parent
        anchors.margins: 20
        clip: true
        model: spaceMen
        delegate: spaceManDelegate
        section.property: "nation"
        section.delegate: sectionDelegate
    }
    
    Component {
        id: spaceManDelegate
        
        Item {
            width: 260
            height: 20
            
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
                font.pixelSize: 12
                text: name
            }
        }
    }
    
    Component {
        id: sectionDelegate
        
        Rectangle {
            width: 260
            height: 20
            color: "lightGray"
            
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
                font.pixelSize: 12
                font.bold: true
                text: section
            }
        }
    }
    
    ListModel {
        id: spaceMen
        
        ListElement { name: "Abdul Ahad Mohmand"; nation: "Afganistan"; }
        ListElement { name: "Marcos Pontes"; nation: "Brazil"; }
        ListElement { name: "Alexandar Panayotov Alexandrov"; nation: "Bulgaria"; }
        ListElement { name: "Georgi Ivanov"; nation: "Bulgaria"; }
        ListElement { name: "Roberta Bondar"; nation: "Canada"; }
        ListElement { name: "Marc Garneau"; nation: "Canada"; }
        ListElement { name: "Chris Hadfield"; nation: "Canada"; }
        ListElement { name: "Guy Laliberte"; nation: "Canada"; }
        ListElement { name: "Steven MacLean"; nation: "Canada"; }
        ListElement { name: "Julie Payette"; nation: "Canada"; }
        ListElement { name: "Robert Thirsk"; nation: "Canada"; }
        ListElement { name: "Bjarni Tryggvason"; nation: "Canada"; }
        ListElement { name: "Dafydd Williams"; nation: "Canada"; }
    }
}