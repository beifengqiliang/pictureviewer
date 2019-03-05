import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

Window {

    Button {
    id: btn_Exit
    text: "Exit"

    onClicked: Qt.quit();

    }
}