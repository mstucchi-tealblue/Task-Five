import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12

// Task Information Popup
Popup {
    property int index_p
    property ListView connected_listview: ListView {model: samplemodel}
    property ListModel connected_model: samplemodel
    width: 500
    height: 300
    closePolicy: Popup.CloseOnEscape
    ColumnLayout{
        RowLayout {
            Label {
                text: "Title"
            }
            TextField {
                id: newtitle
                Layout.fillWidth: true
                selectByMouse: true
                selectionColor: 'darkgray'
                property Item curr: connected_listview.currentItem
                text: curr !== null ? curr.title : "0"
            }
        }
        RowLayout {
            Label {
                text: "Image path"
            }
            TextField {
                id: imagePath
                Layout.fillWidth: true
                selectByMouse: true
                selectionColor: 'darkgray'
                property Item curr: connected_listview.currentItem
                text: curr !== null ? curr.source : "0"
            }            
        }
        RowLayout{
            Button {
                id: applyButton
                text: "Apply"
                onClicked: {
                    connected_model.setProperty(connected_listview.currentIndex, "title", newtitle.text)
                    connected_model.setProperty(connected_listview.currentIndex, "image", imagePath.text)
                }
            }

            Button {
                id: closeButton
                text: "Close"                
                onClicked: {
                    taskInfo.close();
                }
            }
            Button {
                id: deleteButton
                text: "Delete Task"
                highlighted: true
                onClicked: {
                    connected_model.remove(connected_model.index);
                    taskInfo.close()
                }
            }
        }
    }
    // Sample model
    ListModel {
        id: samplemodel
        ListElement {
            title: "Decide what to plan"
            image: "images/background"
        }
    }
}
