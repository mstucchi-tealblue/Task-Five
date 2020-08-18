import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12


Popup {
    property alias x_val: settingPopup.x
    property alias y_val: settingPopup.y
    property alias addListButton: addButton
    property int index
    id: settingPopup
    x:0
    y:0
    height: 120
    width: 120
    ColumnLayout {
        anchors.fill: parent
        Button {
            id: addButton
            text: "Add a list"
            //onClicked: mainWindow.addList()
        }
        Button {
            text: "Remove this list"
            onClicked: mainWindow.removeList(index)
        }
    }
}
