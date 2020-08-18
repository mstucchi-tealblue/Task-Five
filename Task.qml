import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {
    id: root
    property alias title: title.text
    property url url
    property alias source: root.url
    property string desc
    property alias taskwidth: task.width
    implicitHeight: task.height
    implicitWidth: task.width


    Rectangle {
        id: task
        radius: 2
        color: "white"
        width: taskImage.width != 0 ? taskImage.width : title.width
        height: taskImage.height + title.height + lines.height + 10

        Image {
            id: taskImage
            source: Qt.resolvedUrl(url)
            Layout.fillWidth: true
        }

        Text {
            id: title
            text: "Sample task"
            font.pointSize: 20
            anchors.top: taskImage.bottom
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
            visible: taskImage.source != "" ? true : false
        }
    }

}
