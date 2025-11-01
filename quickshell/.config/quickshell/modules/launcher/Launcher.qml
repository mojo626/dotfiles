import Quickshell
import QtQuick
import qs.config

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

        focusable: true

        property int initialHeight: 35

        color: "transparent"

        implicitHeight: 0  
        implicitWidth: 700 

        Rectangle {
            id: backgroundRect

            color: "transparent"

            anchors.fill: parent

            height: searchRect.implicitHeight

            Background {
                id: background
                parentRect: backgroundRect
                menuHeight: shellroot.showLauncher ? window.initialHeight : 0
                onExpanding: {
                    window.implicitHeight = window.initialHeight;
                    searchBar.text = "";
                }
                onRetracted: {
                    window.implicitHeight = 0;
                }
            }

            Rectangle {
                id: searchRect

                width: parent.width - 50

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 50
                anchors.rightMargin: 50

                height: 25
                radius: 50

                color: ColorsConfig.palette.current.primary_container

                TextInput {
                    id: searchBar

                    width: parent.width

                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20

                    height: parent.height

                    verticalAlignment: TextInput.AlignVCenter

                    renderType: Text.NativeRendering

                    color: ColorsConfig.palette.current.text

                    wrapMode: TextInput.Wrap
                }
            }

            


        }

        

    }

}