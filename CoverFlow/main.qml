import QtQuick 2.3
import QtQuick.Window 2.2

Window{
   visible:true
   width:1100; height:900

   ListModel{
       id:model
       ListElement{url:"images/01.jpg"}
       ListElement{url:"images/02.jpg"}
       ListElement{url:"images/03.jpg"}
       ListElement{url:"images/04.jpg"}
       ListElement{url:"images/05.jpg"}
   }

   CoverFlow{
       anchors.fill:parent
       model:model
   }
}