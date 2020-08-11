import QtQuick 2.0
import QtQuick.Layouts 1.3
Rectangle{
    id: root
    color: "#c4c9cc"
    width: 280
    height: 800

    ListModel {
        id: mymodel
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

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20

        Text{
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
            title: model.title
        }
        spacing: 10
    }

    Text{
        text: "Add a card..."
        color: "darkgray"
        font.pointSize: 18
        clip: true

    }

    }
}



