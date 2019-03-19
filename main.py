# -*- coding:utf-8 -*-
from PySide2.QtWidgets import QApplication
from PySide2.QtQuick import QQuickView
from PySide2.QtCore import QUrl

  
app = QApplication([])
view = QQuickView()
url = QUrl("CoverFlow/main.qml")
 
view.setSource(url)
view.show()
view.engine().quit.connect(app.quit)
app.exec_()