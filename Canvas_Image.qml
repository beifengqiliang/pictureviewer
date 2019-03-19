import QtQuick 2.0

/* Canvas--图片裁剪 */

Canvas {
    id: root
    width: 200; height: 200

    onPaint: {
        var ctx = getContext("2d")

        // draw an image
        ctx.drawImage('images/earth.jpg', 10, 10)
        // store current context setu
        ctx.save()
        ctx.strokeStyle = 'red'
        // create a triangle as clip region
        ctx.beginPath()
        ctx.moveTo(10,10)
        ctx.lineTo(55,10)
        ctx.lineTo(35,55)
        ctx.closePath()
        // translate coordinate system
        ctx.translate(100,0)
        // create clip from triangle path
        ctx.clip() 

        // draw image with clip applied
        ctx.drawImage('images/earth.jpg', 10, 10)
        // draw stroke around path
        ctx.stroke()
        // restore previous setup
        ctx.restore()
    }
    
    Component.onCompleted: {
        loadImage("images/earth.jpg")
    }
}