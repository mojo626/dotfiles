import Quickshell
import QtQuick
import qs.config
import QtQuick.Shapes
import qs.components

Variants {
    model: Quickshell.screens;

    id: root

    
    PanelWindow {
        id: window

        required property var modelData
        screen: modelData

        visible: true

        anchors {
            top: true
            right: true
        }

        color: "transparent"

        implicitHeight: 500
        implicitWidth: 0


        Rectangle {

            id: panelRect

            anchors.fill: parent
            
			color: "transparent"

            Background {
                id: background

                menuWidth: shellroot.showControlCenter ? 500 : 0
                parentRect: panelRect

                onExpanding: {
                    window.implicitWidth = 500;
                }

                onRetracted: {
                    window.implicitWidth = 0;
                }
            }


            Rectangle {
                width: window.width - 25
                height: parent.height

                x: window.width - background.menuWidth + 50

                color: "transparent"

                clip: true

                Column {
                    anchors.fill: parent

                    TopRow {}

                    MusicPlayer {}
                }
            }   
            
        }

    }
}