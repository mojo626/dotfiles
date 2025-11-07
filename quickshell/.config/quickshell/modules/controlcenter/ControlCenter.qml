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

        property int centerHeight: topRot.height + wifiBt.fixedHeight + player.height + sliders.height + 70

        // Behavior on centerHeight {
        //     NumberAnimation {
        //         duration: 200
        //         easing.type: Easing.OutCubic
        //     }
        // }


        visible: true

        anchors {
            top: true
            right: true
        }

        color: "transparent"

        height: centerHeight
        implicitWidth: 500


        Rectangle {

            id: panelRect

            width: parent.width
            height: parent.height
            
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
                id: contentRect
                width: window.width - 75
                height: parent.height

                x: window.width - background.menuWidth + 50

                color: "transparent"

                clip: true

                Column {
                    id: mainColumn
                    anchors.fill: parent
                    spacing: 10

                    TopRow {
                        id: topRot
                    }
                    
                    WifiBT {
                        id: wifiBt
                    }

                    MusicPlayer {
                        id: player
                    }

                    Sliders {
                        id: sliders
                    }
                }
            }   
            
        }

    }
}