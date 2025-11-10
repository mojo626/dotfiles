import Quickshell
import QtQuick
import Quickshell.Hyprland
import qs.config

Row {
    id: wsRow
    
    spacing: 10

    Repeater {
         
        model: 10

        Item {
            
            id: wsContainer
            required property int index

            height: wsRow.height
            width: wsIcon.width
            property int activeWidth: 25
            property int inactiveWidth: 10

            property int wsId: index + 1
            property bool isActive: wsId === Hyprland.focusedWorkspace?.id
            property bool occupied: Hyprland.workspaces.values.some(e => e.id == wsId) ?? false
            

            Rectangle {
                id: wsIcon
                width: isActive ? activeWidth : inactiveWidth
                height: 10

                radius: 10
                anchors.verticalCenter: parent.verticalCenter

                color: isActive ? ColorsConfig.palette.current.active_ws : occupied ? ColorsConfig.palette.current.occupied_ws : ColorsConfig.palette.current.empty_ws

                 // smooth animation between widths
                Behavior on width {
                    NumberAnimation {
                        duration: 200
                        easing.type: Easing.OutCubic
                    }
                }

                Behavior on color {
                    PropertyAnimation {
                        duration: 200
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: event => {
                    const ws = wsContainer.wsId;
                    if (Hyprland.focusedWorkspace.id !== ws)
                        Hyprland.dispatch(`workspace ${ws}`);
                }
                onEntered: event => {
                    wsIcon.width = isActive ? activeWidth + 4 : inactiveWidth + 4;
                }
                onExited: event => {
                    wsIcon.width = isActive ? activeWidth : inactiveWidth;
                }
            }

            
        }
    }
}