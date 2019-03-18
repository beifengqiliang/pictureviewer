import QtQuick 2.0

/* 这个例子产生了一个在坐标（50,50），高宽为100的填充矩形框，并且使用了画笔来修饰边界 */

Canvas {
    id: root
    // canvas size
    width: 200; height: 200

    // handler to override for drawing
    // 绘制需要在onPaint事件中完成
    onPaint: {
        // 画布元素（canvas element）的基本思想是使用一个2D对象来渲染路径
        // get context to draw with
        var ctx = getContext("2d")

        // setup the stroke
        // 画笔的宽度被设置为4个像素
        ctx.lineWidth = 4
        // strokeStyle（画笔样式）为蓝色
        ctx.strokeStyle = "blue"

        // setup the fill
        // 设置填充样式（fillStyle）为steelblue颜色
        ctx.fillStyle = "steelblue"
        
        // begin a new path to draw
        ctx.beginPath()
        // top-left start point
        ctx.moveTo(50,50)
        // upper line
        ctx.lineTo(150,50)
        // right line
        ctx.lineTo(150,150)
        // bottom line
        ctx.lineTo(50,150)
        // left line through path closing
        ctx.closePath()
        // fill using fill style
        ctx.fill()
        // stroke using line width and stroke style
        ctx.stroke()
    }
}