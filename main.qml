import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Window {
    property alias mainWindow: window    
    id: window
    height: 1080
    width:1920
    color: "#00c2e0"
    visible: true

    function addList()
    {
        lv.model.insert(lv.model.index,{title: "mamma", image: "" })
    }

    function removeList(index)
    {
        lv.model.remove(index)
    }
    Popup{
        id: alert
        width: 200
        height: 100
        x:990
        y:540
        Rectangle {
            anchors.fill: parent
            color: "red"
            Text {
                anchors.centerIn: parent
                color: "white"
                font.bold : true
                text: "To implement yet"
            }
        }

    }

    Rectangle {
        id: header
        anchors.left: parent.left
        anchors.right: parent.right
        height: boardName.height + 20
        color: "#00c2e0"


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
        anchors {
            top: header.bottom
            bottom: window.bottom
        }
        width: window.width
        ListView {
            id: lv
            height: 1000
            width: 1920
            //anchors.fill: parent
            anchors.margins: 20
            spacing: 10
            orientation: ListView.Horizontal
            model: initializer
            delegate: List { }
        }
    }

    ListModel {
        id: initializer
        ListElement { title : "new"}
    }
}
