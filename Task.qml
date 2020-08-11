import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {
    property alias title: title.text
    property alias source: image.source
    implicitHeight: task.height
    implicitWidth: task.width


    Rectangle {
        id: task
        radius: 10
        color: "white"
        width: image.width != 0 ? image.width : title.width
        height: image.height + title.height

        Image {
            id: image
            Layout.fillWidth: true
            source: "images/background.png"

        }

        Text {
            id: title
            text: "Sample task"
            font.pointSize: 20
            anchors.top: image.bottom

        }

    }

}
