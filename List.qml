import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.12

Rectangle{
    id: root
    color: "#c4c9cc"
    width: 280
    height: 800

    property alias title: listTitle.text
    property alias model: listViewOfTasks.model
    //property alias addCardMouseExt: addCardMouse

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10

        RowLayout{
            spacing: 100
            TextInput{
                id: listTitle
                text: "Add a list title"
                color: "black"
                font.pointSize: 18
                selectByMouse: true
                selectionColor: 'darkgray'
                clip: true
            }
            Image {
                id: listSettingsImage
                source: "images/dots.png"
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        listViewOfTasks.currentIndex = index;
                        settingPopup.open()
                    }
                }
            }
        }

        ListView {
            id: listViewOfTasks
            height: 650
            width: parent.width
            anchors.margins:10
            clip:true
            model: newListModel
            delegate: Task{
                id: task
                titleOfTask: model.title
                sourceOfTaskImage: model.image
                descOfTask: model.desc
                taskWidth: listViewOfTasks.width
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        listViewOfTasks.currentIndex = index;
                        taskInfo.open();
                    }
                }
            }
            spacing: 10
        }

        Text{
            id: addCardText
            text: "Add a card..."
            color: "darkgray"
            font.pointSize: 18
            clip: true
            MouseArea {
                id: addCardMouse
                anchors.fill: parent
                onClicked: addList.open()
            }
        }

    }

    // Popups
    ListSettingsPopup {
        id: settingPopup
        x_val : listSettingsImage.x
        y_val : listSettingsImage.y
        index: listViewOfTasks.currentIndex

    }

    InfoPopup {
        id: taskInfo
        connectedListview: listViewOfTasks
        connectedModel: listViewOfTasks.model
    }

    AddListPopup {
        id: addList
        connected_model: listViewOfTasks.model

    }

    // Sample model
    ListModel {
        id: newListModel
        ListElement {
            title: "Add your task.."
            image: "images/background"
            desc: ""
        }
    }
}





