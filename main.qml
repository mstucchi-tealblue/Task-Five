import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Window {
    property alias mainWindow: window    
    id: window
    height: 1080
    width:1920
    color: taskInfoPopup.opened || addCardPopup.opened ? "#48a9c5" : "#00c2e0"
    visible: true


    Rectangle {
        id: header
        anchors.left: parent.left
        anchors.right: parent.right
        height: boardName.height + 20
        color: taskInfoPopup.opened || addCardPopup.opened ? "#48a9c5" : "#00c2e0"

        TextInput {
            id: boardName
            text: "Teal-Blue"
            font.pointSize: 20
            font.bold: true
            color: "white"
            anchors {
                top: parent.top
                topMargin: 10
                left: parent.left
                leftMargin: 10
            }

            Image {
                id: star
                property bool preferred: true
                source: preferred ? "images/star.png" : "images/filled_star.png"
                scale: 0.4
                anchors {
                    left: boardName.right
                    verticalCenter: boardName.verticalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: star.preferred = !star.preferred
                }
            }
        }
    }

    Rectangle {
        id: lvContainer
        x:20
        anchors {
            top: header.bottom
            bottom: window.bottom            
        }
        width: window.width
        opacity: taskInfoPopup.opened || addCardPopup.opened ? 0.6 : 1

        ListView {
            id: lv
            height: 1000
            width: 1800
            //anchors.fill: parent
            spacing: 10
            orientation: ListView.Horizontal
            model: initializer
            delegate: List {
                id: listOfTasks
            }
        }
    }


    ListModel {
        id: initializer
        ListElement { title : "new"}
    }    

    //Popups
    InfoPopup {
        id: taskInfoPopup
        width: 400
        height: 300
        x: window.width/2 - taskInfoPopup.width/2
        y: window.height/2 - taskInfoPopup.height/2
    }

    AddTaskPopup {
        id: addCardPopup
        width: 400
        height: 300
        x: window.width/2 - taskInfoPopup.width/2
        y: window.height/2 - taskInfoPopup.height/2
    }

    //Functions
    function addList()
    {
        lv.model.insert(lv.model.index,{})
    }

    function removeList(index)
    {
        lv.model.remove(index)
    }

    function openInfoPopup(lv, lvmodel)
    {
        taskInfoPopup.connectedListview = lv
        taskInfoPopup.connectedModel = lvmodel
        taskInfoPopup.open()
    }

    function openAddListPopup(lvmodel)
    {
        addCardPopup.connectedModel = lvmodel
        addCardPopup.open()
    }
}
