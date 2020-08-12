import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 1080
    height: 1080
    title: qsTr("Trello")

    Rectangle {
        id: root
        anchors.fill: parent
        color: "#00c2e0"

        ListModel {
            id:mymodel1
            ListElement {
                title: "Take a shower"
            }
            ListElement {
                title: "Read the book"
            }
            ListElement {
                title: "Take out the dog"
            }
        }

        Column {
            spacing: 20

            Row {
                id: header
                TextInput {
                    id: boardName
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    text: "Teal-Blue"
                    font.pointSize: 20
                    font.bold: true
                    color: "white"

                    Image {
                        source: "images/star.png"
                        scale: 0.4
                        anchors {
                            left: boardName.right
                            verticalCenter: boardName.verticalCenter
                        }
                    }
                }


            }

            Row {
                spacing: 10

                List{
                    model: mymodel1
                    //mainRoot: root
                }
                List{
                    title: "Todo"
                    //mainRoot: root
                }
                List{
                    title: "Doing"
                    //mainRoot: root
                    model: ""
                }

            }
        }
    }

}
