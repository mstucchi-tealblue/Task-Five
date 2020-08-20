import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {
    id: root
    property url url
    property string descOfTask
    property alias titleOfTask: taskTitle.text
    property alias sourceOfTaskImage: root.url
    property alias taskWidth: task.width

    implicitHeight: task.height
    implicitWidth: task.width

    Rectangle {
        id: task
        radius: 2
        color: "white"
        width: taskImage.width != 0 ? taskImage.width : taskTitle.width
        height: taskImage.height + taskTitle.height + taskLinesImage.height + 10

        Image {
            id: taskImage
            source: Qt.resolvedUrl(url)
            Layout.fillWidth: true
        }

        Text {
            id: taskTitle
            text: "Sample task"
            font.pointSize: 20
            anchors.top: taskImage.bottom
        }

        Image {
            id: taskLinesImage
            source: "images/lines.png"
            anchors {
                top: taskTitle.bottom
                topMargin: 5
            }
        }

        Image {
            id: taskAttachImage
            source: "images/attach.png"
            anchors {
                top: taskTitle.bottom
                topMargin: 5
                left: taskLinesImage.right
                leftMargin: 5
            }
            visible: taskImage.source != "" ? true : false
        }
    }

}
