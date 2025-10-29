import Quickshell
import QtQuick
import Quickshell.Hyprland
import qs.config

Row {
    id: wsRow

    anchors {
        leftMargin: 10
        rightMargin: 10
    }
    spacing: 0

    Repeater {
        model: Hyprland.workspaces.values.length

        Item {
            id: wsContainer
            required property int index

            height: wsRow.height
            width: 25
            property int fontSize: 17
            

            Text {
                id: wsText
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: wsContainer.fontSize
                text: Hyprland.workspaces.values[index].id == Hyprland.focusedWorkspace.id ? "" : ""

                color: ColorsConfig.palette.current.text

              
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: event => {
                    const ws = wsContainer.index + 1;
                    if (Hyprland.focusedWorkspace.id !== ws)
                        Hyprland.dispatch(`workspace ${ws}`);
                }
                onEntered: event => {
                    wsContainer.fontSize = 23;
                    //animateSize.start();
                }
                onExited: event => {
                    wsContainer.fontSize = 17;
                }
            }

            
        }
    }
}