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

        Text{
            id:listTitle
            text: "Resources"
            color: "black"
            font.pointSize: 18
            clip: true
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
                taskwidth: parent.width
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
            connected_model: mymodel
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
}



