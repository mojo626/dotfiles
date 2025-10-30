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

        visible: !(panelRect.x == panelRect.width + 50)

        anchors {
            top: true
            right: true
        }

        color: "transparent"

        height: 550
        width: 500

        Rectangle {

            id: panelRect

            width: parent.width - 50 //allow for space in the window to have filleted corners
			height: parent.height - 50 //allow for space in the window to have filleted corners
            
			color: ColorsConfig.palette.current.bar_background

            bottomLeftRadius: 25

            x: shellroot.showControlCenter ? 50 : panelRect.width + 50
            y: 0

            Behavior on x {
                NumberAnimation { 
                    duration: 300; 
                    easing.type: Easing.OutCubic 
                    onFinished: {
                        console.log("hello");
                    }
                }
            }



            Column {
                anchors.fill: parent

                TopRow {}

                MusicPlayer {}
            }
        }


        FilletedCorner {
            radius: 50
            xOffset: panelRect.x - 50
        }


        FilletedCorner {
            radius: 50
            xOffset: parent.width - 50 + (panelRect.x - 50)
            yOffset: parent.height - 50
        }

    }
}