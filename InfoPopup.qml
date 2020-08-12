import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12

// Task Information Popup
Popup {
    property int index
    width: 500
    height: 300
    closePolicy: Popup.CloseOnEscape
    ColumnLayout{
        RowLayout {
            Label {
                text: "Title"
            }

            TextField {
                Layout.fillWidth: true
                property Item curr: lv.currentItem
                text: curr.title
            }
        }
        RowLayout {
            Label {
                text: "Image path"
            }
            TextField {
                Layout.fillWidth: true
                property Item curr: lv.currentItem
                text: curr.source
            }
        }
        RowLayout{
            Button {
                id: closeButton
                text: "Close"
                onClicked: {
                    taskInfo.close();
                }
            }
        }
    }
}
