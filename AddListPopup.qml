import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12

Popup {
    id: addListPopup
    property ListModel connected_model: samplemodel
    width: 200
    height: 300
    focus: true
    closePolicy: Popup.CloseOnEscape
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5
        RowLayout {
            Layout.alignment: Qt.AlignTop
            Label {
                text: "New task name"
            }
            TextField {
                id:newtitle
                Layout.fillWidth: true
                selectByMouse: true
                selectionColor: 'darkgray'
            }
        }
        RowLayout {
            Label {
                text: "Image source (optional)"
            }
            TextField {
                id: imagePath
                Layout.fillWidth: true
                selectByMouse: true
                selectionColor: 'darkgray'
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignBottom | Qt.AlignRight
            Button {
                id: okButton
                text: "Ok"
                onClicked: {
                    addListPopup.close();
                    connected_model.insert(connected_model.index, {title: newtitle.text, image: imagePath.text});
                    newtitle.clear();
                    imagePath.clear();
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
