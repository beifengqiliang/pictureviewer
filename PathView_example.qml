import QtQuick 2.0

/*--这个例子展示了路径视图（PathView）如何创建一个卡片视图，并且用户可以滑动它，但是有bug，滑动不了--*/

Item {
    id: root
    width: 300
    height: 400
    
    PathView {
        anchors.fill: parent
        delegate: flipCardDelegate
        model: 100
        
        path: Path {
            // 路径使用startx与starty属性来链接路径（path）元素
            startX: root.width/2
            startY: 0
            
            // 使用PathAttribute元素来控制旋转，大小和深度值（z-value）
            PathAttribute { name: "itemZ"; value: 0 }
            PathAttribute { name: "itemAngle"; value: -90.0; }
            PathAttribute { name: "itemScale"; value: 0.5; }
            // 路径由PathLine元素组成
            PathLine { x: root.width/2; y: root.height*0.4; }
            // 使用PathPercent元素，它确保了中间的元素居中，并且给其它的元素提供了足够的空间
            PathPercent { value: 0.48; }
            PathLine { x: root.width/2; y: root.height*0.5; }
            PathAttribute { name: "itemAngle"; value: 0.0; }
            PathAttribute { name: "itemScale"; value: 1.0; }
            PathAttribute { name: "itemZ"; value: 100 }
            PathLine { x: root.width/2; y: root.height*0.6; }
            PathPercent { value: 0.52; }
            PathLine { x: root.width/2; y: root.height; }
            PathAttribute { name: "itemAngle"; value: 90.0; }
            PathAttribute { name: "itemScale"; value: 0.5; }
            PathAttribute { name: "itemZ"; value: 0 }
        }
        
        // 控制路径的浓密度
        pathItemCount: 16
        // preferredHighLightBegin属性控制了高亮区间
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5

        /*preferredHightlightBegin与preferredHighlightEnd属性由PathView（路径视图）输
          入到图片元素中。它们的值在0~1之间。结束值大于等于开始值。例如设置这些属
          性值为0.5，当前项只会显示当前百分之50的图像在这个路径上。*/
    }
    
    Component {
        id: flipCardDelegate
        
        Item {
            id: wrapper
            width: 64
            height: 64
            visible: PathView.onPath
            // 缩放
            scale: PathView.itemScale
            z: PathView.itemZ
            property variant rotX: PathView.itemAngle
        
            transform: Rotation { 
                axis { x: 1; y: 0; z: 0 } 
                angle: wrapper.rotX; 
                origin { x: 32; y: 32; } 
            }

            Rectangle {
                anchors.fill: parent
                color: "lightGray"
                border.color: "black"
                border.width: 3
            }
            
            Text {
                anchors.centerIn: parent
                text: index
                font.pixelSize: 30
            }
        }
    }
}