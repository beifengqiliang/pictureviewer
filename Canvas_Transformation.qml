import QtQuick 2.0

Canvas {
    id: root
    width: 240; height: 120
    
    onPaint: {
        var ctx = getContext("2d")

        ctx.strokeStyle = "blue"
        ctx.lineWidth = 4
        ctx.beginPath()
        ctx.rect(20, 20, 40, 40)
        ctx.translate(0,60)
        ctx.stroke()

        // draw path now rotated
        ctx.strokeStyle = "green"
        // 有bug，不知道为什么不旋转
        ctx.rotate(Math.PI/4)
        ctx.stroke()
    }
}