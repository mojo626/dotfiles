import Quickshell
import QtQuick
import qs.config
import QtQuick.Shapes
import qs.components

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

        color: "transparent"

        height: 550
        width: 500

        Rectangle {
            id: panelRect

            width: parent.width - 50
			height: parent.height - 50
            anchors.top: parent.top
            anchors.right: parent.right
			color: ColorsConfig.palette.current.bar_background

            bottomLeftRadius: 25


            Column {
                anchors.fill: parent

                TopRow {}
            }
        }


        FilletedCorner {
            radius: 50
        }


        FilletedCorner {
            radius: 50
            xOffset: parent.width - 50
            yOffset: parent.height - 50
        }

    }
}