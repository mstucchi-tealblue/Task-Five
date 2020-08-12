import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 1080
    height: 1080

    Rectangle {
        id: root
        anchors.fill: parent
        color: "#00c2e0"


        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10

            RowLayout {
                id: header
                TextInput {
                    id: boardName
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    text: "Teal-Blue"
                    font.pointSize: 20
                    font.bold: true
                    color: "white"

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

            RowLayout {
                spacing: 10
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop

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

    ListModel {
        id:mymodel1
        ListElement {
            title: "Take a shower"
            image: ""
        }
        ListElement {
            title: "Read the book"
            image: ""
        }
        ListElement {
            title: "Take out the dog"
            image: ""
        }
    }


}
