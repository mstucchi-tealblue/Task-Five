import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12

Popup {
    id: addListPopup    
    width: 200
    height: 300
    focus: true
    closePolicy: Popup.CloseOnEscape
    property ListModel connected_model: sampleModel

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5
        RowLayout {
            Layout.alignment: Qt.AlignTop
            Label {
                text: "New task name"
            }
            TextField {
                id: newTitleContainer
                Layout.fillWidth: true
                selectByMouse: true
                selectionColor: 'darkgray'
                placeholderText: "Insert new task title"
            }
        }
        RowLayout {
            Label {
                text: "Image source (optional)"
            }
            TextField {
                id: newImagePathContainer
                Layout.fillWidth: true
                selectByMouse: true
                selectionColor: 'darkgray'
                placeholderText: "Insert new task image path"
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignBottom | Qt.AlignRight
            Button {
                id: okButton
                text: "Ok"
                onClicked: {
                    addListPopup.close();
                    connected_model.insert(connected_model.index, {title: newTitleContainer.text, image: newImagePathContainer.text, desc: ""});
                    newTitleContainer.clear();
                    newImagePathContainer.clear();
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
        }
    }
}
