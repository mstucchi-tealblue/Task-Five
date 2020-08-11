import QtQuick 2.0
import QtQuick.Layouts 1.3

Item{
    implicitHeight: list.height
    implicitWidth: list.width


    ListModel {
        ListElement {
            title: "Take out the dog"
        }
        ListElement {
            title: "Take a shower"
        }
        ListElement {
            title: "Read the book"
        }
    }



    Rectangle {
        id: list
        radius: 5
        color: "#c4c9cc"
        width: task1.width + 40
        height: 800


        ColumnLayout{
            id: taskgroup

            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 15


            TextInput {
                id: listname
                text: "Resource"
                font.bold: true
                font.pointSize: 20
                anchors {
                    top: parent.top
                    topMargin: 5
                }
            }

            Image {
                id: dots
                source: "images/dots.png"
                scale: 0.5
                anchors{
                    right: parent.right
                    top: parent.top
                    verticalCenter: listname.verticalCenter
                }
            }

            Task{
                id: task1

            }

            Task{

            }

            Text {
                id: newCardRequest
                text: "Add a card..."
                color: "darkgray"
                font.pointSize: 18
            }
        }


    }
}


