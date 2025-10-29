import QtQuick
import qs.config


Row {
    spacing: 10
    anchors.fill: parent

    Rectangle {
        height: parent.height
        width: ws.implicitWidth + 30
        color: ColorsConfig.palette.current.bar_background

        Workspaces {
            id: ws
            anchors.fill: parent
        }

    }

}