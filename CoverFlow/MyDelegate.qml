import QtQuick 2.3

Item{
    id:delegateItem
    width:320
    height:450
    z:PathView.iconZ
    scale:PathView.iconScale

    Column  {
        id:delegate
        spacing:10

        Image{
           id:dlgImg
           source:url
           width:delegateItem.width
           height:delegateItem.height
        }

        Image{
           id:reflection
           width:delegateItem.width
           height:delegateItem.height
           source:dlgImg.source
           opacity:0.4
           transform:Scale{
               yScale:-1
               origin.y:delegateItem.height/2
            }
        }
    }

    transform:Rotation{
       origin.x:dlgImg.width/2
       origin.y:dlgImg.height/2
        axis{x:0;y:1;z:0}
       angle:delegateItem.PathView.iconAngle
    }
}