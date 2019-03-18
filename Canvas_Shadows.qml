import QtQuick 2.0

/*阴影是一个区域的轮廓线使用偏移量，颜色和模糊来实现的。
* 所以你需要指定一个阴影颜色（shadowColor），阴影X轴偏移值（shadowOffsetX），
* 阴影Y轴偏移值（shadowOffsetY）和阴影模糊（shadowBlur）*/

Canvas {
    id: root
    width: 200; height: 200
    
    onPaint: {
        var ctx = getContext("2d")

        // 设置一个黑色背景
        ctx.strokeStyle = "#333"
        ctx.fillRect(0,0,root.width,root.height);

        // 定义阴影配置
        ctx.shadowColor = "blue";
        // 阴影偏移值
        ctx.shadowOffsetX = 4;
        ctx.shadowOffsetY = 4;
        // 阴影模糊
        // ctx.shadowBlur = 0.2


        // 绘制文本，加粗的，80像素宽度的Ubuntu字体
        ctx.font = 'Bold 80px Ubuntu';
        ctx.fillStyle = "white";
        ctx.fillText("Earth",30,180);
    }
}