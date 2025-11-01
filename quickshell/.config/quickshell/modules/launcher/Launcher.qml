import Quickshell
import QtQuick

Variants {
    model: Quickshell.screens;

    id: root

    


    PanelWindow {
        id: window

        required property var modelData
        screen: modelData

        visible: true

        exclusionMode: ExclusionMode.Ignore

        anchors {
            top: true

        }

        margins.top: 30



        color: "transparent"

        implicitHeight: 100  
        implicitWidth: 700 

        Rectangle {
            id: backgroundRect

            color: "transparent"

            anchors.fill: parent

            Background {
                id: background
                parentRect: backgroundRect
                menuHeight: shellroot.showLauncher ? 100 : 0
                onExpanding: {
                    window.implicitHeight = 100
                }
                onRetracted: {
                    window.implicitHeight = 0;
                }
            }

            TextInput {
                anchors.fill: parent
            }

        }

        

    }

}