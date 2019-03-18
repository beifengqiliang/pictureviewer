import QtQuick 2.0
import QtQuick.XmlListModel 2.0

/* 由于XML是一种常见的数据格式，QML提供了XmlListModel元素来包装XML数据。
*  这个元素能够获取本地或者网络上的XML数据，然后通过XPath解析这些数据。
*  下面这个例子展示了从RSS流中获取图片，源属性（source）引用了一个网络地
*  址，这个数据会自动下载
*  bug解决: 网址失效，图片无法下载，建议换掉源
*/

Item {
    width: 300
    height: 480
    
    Component {
        id: imageDelegate
        
        Item {
            width: listView.width
            height: 400
            
            Column {

                Text {
                    text: title
                }
                Image {
                    source: imageSource
                }
            }
        }
    }
    
    XmlListModel {
        id: imageModel
        source: "http://feeds.nationalgeographic.com/ng/photography/photo-of-the-day/"
        // 查询属性（query）是一个XPath代理的基础查询，用来创建模型项
        query: "/rss/channel/item"
        // 每一个模型项，一些规则需要被提取，由XmlRole元素来代理
        XmlRole { name: "title"; query: "title/string()" }
        // 使用XPath的函数substring-after与substring-before，可以提取本地的图片资源。这样imageSource属性就可以直接被作为一个Image元素的source属性使用
        XmlRole { name: "imageSource"; query: "substring-before(substring-after(description/string(), 'img src=\"'), '\"')" }
    }
    
    ListView {
        id: listView
        anchors.fill: parent
        model: imageModel
        delegate: imageDelegate
    }
}