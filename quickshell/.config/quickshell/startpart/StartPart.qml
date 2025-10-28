import QtQuick


Row {
    spacing: 10
    anchors.fill: parent

    Rectangle {
        height: parent.height
        width: ws.implicitWidth + 30

        Workspaces {
            id: ws
            anchors.fill: parent
        }

    }

}