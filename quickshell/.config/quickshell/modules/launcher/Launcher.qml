import Quickshell
import QtQuick

Variants {
    model: Quickshell.screens;

    id: root

    


    PanelWindow {

        required property var modelData
        screen: modelData

        visible: true

        exclusionMode: ExclusionMode.Ignore

        anchors {
            top: true

        }

        margins.top: 30



        color: "transparent"

        height: 200
        width: 700

        Rectangle {
            id: backgroundRect

            //color: "#ffffff"
            color: "transparent"

            anchors.fill: parent

            Background {
                parentRect: backgroundRect

            }

        }

        

    }

}