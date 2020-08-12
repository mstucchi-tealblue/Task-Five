import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {
    property alias title: title.text
    property alias source: image.source
    property alias taskwidth: task.width
    implicitHeight: task.height
    implicitWidth: task.width


    Rectangle {
        id: task
        radius: 2
        color: "white"
        width: image.width != 0 ? image.width : title.width
        height: image.height + title.height + lines.height + 10

        Image {
            id: image
            source: ""
            Layout.fillWidth: true

        }

        Text {
            id: title
            text: "Sample task"
            font.pointSize: 20
            anchors.top: image.bottom
        }

        Image {
            id: lines
            source: "images/lines.png"
            anchors {
                top: title.bottom
                topMargin: 5
            }
        }

        Image {
            id: attach
            source: "images/attach.png"
            anchors {
                top: title.bottom
                topMargin: 5
                left: lines.right
                leftMargin: 5
            }
            visible: image.source != "" ? true : false
        }
    }

}
