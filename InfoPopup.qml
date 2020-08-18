import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12

// Task Information Popup
Popup {
    property int index_p
    property ListView connectedListview: ListView {model: sampleModel}
    property ListModel connectedModel: sampleModel
    width: 500
    height: 300
    closePolicy: Popup.CloseOnEscape
    ColumnLayout{
        RowLayout {
            Label {
                text: "Title"
            }
            TextField {
                id: newTitle
                Layout.fillWidth: true
                selectByMouse: true
                selectionColor: 'darkgray'
                property Item curr: connectedListview.currentItem
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
                property Item curr: connectedListview.currentItem
                text: curr !== null ? curr.source : "0"
            }
        }

        RowLayout {

            Label {
                text: "Description"
            }
            TextArea {
                id: taskDesc
                Layout.rowSpan: 4
                Layout.fillWidth: true
                Layout.fillHeight: true
                placeholderText: "Add task description"
                property Item curr: connectedListview.currentItem
                text: curr !== null ? curr.desc : "0"
            }
        }

        RowLayout{
            Button {
                id: applyButton
                text: "Apply"
                onClicked: {
                    connectedModel.setProperty(connectedListview.currentIndex, "title", newTitle.text)
                    connectedModel.setProperty(connectedListview.currentIndex, "image", imagePath.text)
                    connectedModel.setProperty(connectedListview.currentIndex, "desc", taskDesc.text)
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
                    connectedModel.remove(connectedModel.index);
                    taskInfo.close()
                }
            }
        }
    }
    // Sample model
    ListModel {
        id: sampleModel
        ListElement {
            title: "Decide what to plan"
            image: "images/background"
            desc: ""
        }
    }
}
