import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12

Popup {
    property alias x_val: setting_pop.x
    property alias y_val: setting_pop.y
    property int index
    id: setting_pop
    x:0
    y:0
    height: 120
    width: 120
    ColumnLayout {
        anchors.fill: parent
        Button {
            text: "Add a list"
            onClicked: mainWindow.addList()
        }
        Button {
            text: "Remove this list"
            onClicked: mainWindow.removeList(index)
        }
    }
}
