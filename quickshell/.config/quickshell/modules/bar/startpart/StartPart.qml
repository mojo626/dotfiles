import QtQuick
import qs.config
import Quickshell.Services.SystemTray


Row {
    spacing: 10
    anchors.fill: parent

    property var systemTray: SystemTray

    Rectangle {
        height: parent.height
        width: ws.implicitWidth + 30
        color: ColorsConfig.palette.current.bar_background

        Workspaces {
            id: ws
            anchors.fill: parent
        }

        Repeater {
        model: systemTray.items
            delegate: Text {
                text: "hi"
            }
        }

    }

}