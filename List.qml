import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12

Rectangle{
    id: root
    color: "#c4c9cc"
    width: 280
    height: 800
    property alias model: lv.model
    property alias title: listTitle.text
    property Rectangle mainRoot

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10

        RowLayout{
            spacing: 100
            TextInput{
                id:listTitle
                text: "Resources"
                color: "black"
                font.pointSize: 18
                selectByMouse: true
                selectionColor: 'darkgray'
                clip: true
            }
            Image {
                id: settings
                source: "images/dots.png"
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        lv.currentIndex = index;
                        setting_popup.open()
                    }
                }

            }
        }

        ListView {
            id: lv
            height: 650
            width: parent.width
            anchors.margins:10
            clip:true
            model: newListModel
            delegate: Task{
                id: task
                title: model.title
                source: model.image
                desc: model.desc
                taskwidth: lv.width
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        lv.currentIndex = index;
                        taskInfo.open();
                    }
                }
            }
            spacing: 10
        }

        Text{
            text: "Add a card..."
            color: "darkgray"
            font.pointSize: 18
            clip: true
            MouseArea {
                anchors.fill: parent
                onClicked: addList.open()
            }
        }

    }

    // Popups

    ListSettingsPopup {
        id: setting_popup
        x_val : settings.x
        y_val : settings.y
        index: lv.currentIndex

    }

    InfoPopup {
        id: taskInfo
        connected_listview: lv
        connected_model: lv.model
    }

    AddListPopup {
        id: addList
        connected_model: lv.model

    }

    // Sample model
    ListModel {
        id:newListModel
        ListElement {
            title: "Add your task.."
            image: "images/background"
            desc: ""
        }
    }
}





