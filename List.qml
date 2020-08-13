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
            Text{
                id:listTitle
                text: "Resources"
                color: "black"
                font.pointSize: 18
                clip: true
            }
            Image {
                id: settings
                source: "images/dots.png"
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        setting_pop.x_val = settings.x
                        setting_pop.y_val = settings.y
                        setting_pop.open()
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
            model: mymodel
            delegate: Task{
                id: task
                title: model.title
                source: model.image
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

        InfoPopup {
            id: taskInfo
            connected_listview: lv
            connected_model: lv.model
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

        AddListPopup {
            id: addList
            connected_model: lv.model
        }

    }
    // Sample model
    ListModel {
        id:mymodel
        ListElement {
            title: "Take out the dog"
            image: "images/background"
        }
        ListElement {
            title: "Take a shower"
            image: ""
        }
        ListElement {
            title: "Read the book"
            image: ""
        }
    }

    Popup {
        property alias x_val: setting_pop.x
        property alias y_val: setting_pop.y
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
            }
        }
    }
}





