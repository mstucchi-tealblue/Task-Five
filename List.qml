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
                        taskInfo.open();
                        taskInfo.index = model.index
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
                onClicked: popup.open()
            }

        }

        // Task Information Popup
        Popup {
            id: taskInfo
            anchors.centerIn: parent
            property int index
            width: 500
            height: 300
            closePolicy: Popup.CloseOnEscape

            ColumnLayout{
                //                RowLayout {
                //                    Label {
                //                        text: "Title"
                //                    }

                //                    TextField {
                //                        property int index: taskInfo.index
                //                        Layout.fillWidth: true
                //                        text: lv.itemAtIndex.title
                //                    }
                //                }

                //                RowLayout {
                //                    Label {
                //                        text: "Image"
                //                    }

                //                    TextField {
                //                        property int index: taskInfo.index
                //                        Layout.fillWidth: true
                //                        text: lv.itemAtIndex(index).image
                //                    }
                //                }

                RowLayout{
                    Button {
                        id: closeButton
                        text: "Close"
                        onClicked: {
                            taskInfo.close();
                        }
                    }
                }



            }


        }

        Popup {
            id: popup
            anchors.centerIn: parent
            width: 200
            height: 300
            modal: true
            focus: true
            closePolicy: Popup.CloseOnEscape


            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 5

                RowLayout {
                    Layout.alignment: Qt.AlignTop

                    Label {
                        text: "New task name"
                    }

                    TextField {
                        id:newtitle
                        Layout.fillWidth: true
                    }
                }

                RowLayout {
                    Label {
                        text: "Image source (optional)"
                    }
                    TextField {
                        id: imagePath
                        Layout.fillWidth: true
                    }
                }

                RowLayout {
                    Layout.alignment: Qt.AlignBottom | Qt.AlignRight
                    Button {
                        id: okButton
                        text: "Ok"
                        onClicked: {
                            popup.close();
                            mymodel.insert(mymodel.index, {title: newtitle.text, image: imagePath.text})

                        }
                    }
                }
            }
        }

    }
}



