import QtQuick 2.0

/*当你使用画布时，你可以检索读取画布上的像素数据，或者操作画布上的像素。
* 在这个例子中，我们每秒在左边的画布中绘制一个的圆形。当使用鼠标点击画
* 布内容时，会将内容存储为一个图片链接。在右边将会展示这个存储的图片。
*/

Rectangle {
    width: 240; height: 120
    
    Canvas {
        id: canvas
        x: 10; y: 10
        width: 100; height: 100
        property real hue: 0.0
        
        onPaint: {
            var ctx = getContext("2d")
            var x = 10 + Math.random(80)*80
            var y = 10 + Math.random(80)*80
            hue += Math.random()*0.1
            
            if(hue > 1.0) { hue -= 1 }
            ctx.globalAlpha = 0.7
            ctx.fillStyle = Qt.hsla(hue, 0.5, 0.5, 1.0)
            ctx.beginPath()
            ctx.moveTo(x+5,y)
            ctx.arc(x,y, x/10, 0, 360)
            ctx.closePath()
            ctx.fill()
        }
        
        MouseArea {
            anchors.fill: parent
            
            onClicked: {
                // 将画布的数据存储进一张图片中
                var url = canvas.toDataURL('image/png')
                print('image url=', url)
                image.source = url
            }
        }
    }
    
    Image {
        id: image
        x: 130; y: 10
        width: 100; height: 100
    }
    
    Timer {
        interval: 1000
        running: true
        triggeredOnStart: true
        repeat: true
        onTriggered: canvas.requestPaint()
    }
}