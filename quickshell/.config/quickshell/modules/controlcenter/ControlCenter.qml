import Quickshell
import QtQuick
import qs.config

Variants {
    model: Quickshell.screens;

    id: root


    PanelWindow {

        required property var modelData
        screen: modelData

        visible: shellroot.showControlCenter

        anchors {
            top: true
            right: true
        }

        margins.right: 10
        margins.top: 10

        implicitHeight: 500
        implicitWidth: 500

        Rectangle {
			anchors.fill: parent
			color: ColorsConfig.palette.current.bar_background

            Column {
                anchors.fill: parent

                TopRow {}
            }
        }

    }
}