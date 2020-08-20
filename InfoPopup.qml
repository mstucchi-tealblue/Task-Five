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
                id: taskTitleContainer
                Layout.fillWidth: true
                selectByMouse: true
                selectionColor: 'darkgray'
                placeholderText: "Set a title"
                property Item curr: connectedListview.currentItem
                text: curr !== null ? curr.titleOfTask : taskTitleContainer.placeholderText
            }
        }
        RowLayout {
            Label {
                text: "Image path"
            }
            TextField {
                id: taskImagePathContainer
                Layout.fillWidth: true
                selectByMouse: true
                selectionColor: 'darkgray'
                placeholderText: "Set an image"
                property Item curr: connectedListview.currentItem
                text: curr !== null ? curr.sourceOfTaskImage : taskImagePathContainer.placeholderText
            }
        }

        RowLayout {
            Label {
                text: "Description"
            }
            TextArea {
                id: taskDescContainer
                Layout.rowSpan: 4
                Layout.fillWidth: true
                Layout.fillHeight: true
                placeholderText: "Add task description"
                property Item curr: connectedListview.currentItem
                text: curr !== null ? curr.descOfTask : taskDescContainer.placeholderText
            }
        }

        RowLayout{
            Button {
                id: applyButton
                text: "Apply"
                onClicked: {
                    connectedModel.setProperty(connectedListview.currentIndex, "title", taskTitleContainer.text)
                    connectedModel.setProperty(connectedListview.currentIndex, "image", taskImagePathContainer.text)
                    connectedModel.setProperty(connectedListview.currentIndex, "desc", taskDescContainer.text)
                }
            }

            Button {
                id: closeButton
                text: "Close"                
                onClicked: {
                    taskInfoPopup.close();
                }
            }
            Button {
                id: deleteButton
                text: "Delete Task"
                highlighted: true
                onClicked: {
                    connectedModel.remove(connectedModel.index);
                    taskInfoPopup.close()
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
