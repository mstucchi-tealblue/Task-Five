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

    function addList()
    {
        lv.model += 1
    }

    Rectangle {
        id: header
        color: "gray"
        anchors.left: parent.left
        anchors.right: parent.right
        height: boardName.height + 20

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

//        Text {
//            id: plus
//            text: "+"
//            anchors{
//                right:  window.right
//                top: window.top
//            }

//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    lv.model += 1
//                }
//            }
//        }



    }

    Rectangle {
        id: root
        anchors {
            top: header.bottom
            bottom: window.bottom
        }
        width: window.width

        property var models: [gen, fra]
        ListView {
            id: lv
            height: 800
            width: 300
            anchors.fill: parent
            anchors.margins: 20
            spacing: 10
            orientation: ListView.Horizontal
            model:3
            delegate: List { }
        }


    }

    ListModel {
        id: gen
        ListElement {
            title: "mamma"
            image: ""
        }
        ListElement {
            title: "papa"
            image: ""
        }

    }

    ListModel {
        id: fra
        ListElement {
            title: "fratello"
            image: ""
        }
    }
}





