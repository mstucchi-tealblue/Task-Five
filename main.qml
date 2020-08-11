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


        Row {
            id: header
            TextInput {
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                text: "Teal-Blue"
                font.pointSize: 20
                font.bold: true
                color: "white"
            }

            Image {
                source: "images/star.png"
                scale: 0.4
            }
        }

        GridLayout {
            anchors.fill: parent

            TryList {
                //Layout.fillWidth: true


            }
            TryList {
                //Layout.fillWidth: true
            }



        }
    }

}
