import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import qs.components
import qs.services
import qs.config

Row {
    spacing: 5
    anchors.fill: parent
    layoutDirection: Qt.RightToLeft

    id: endRow
    

    Rectangle {
        height: endRow.height
        width: 25
        color: ColorsConfig.palette.current.bar_background

        IconButton {
            id: centerButton
            text: "󱄅"
            fontSize: 20
            buttonWidth: parent.width
            onClicked:  {
                shellroot.showControlCenter = !shellroot.showControlCenter
            }
        }
    }
    

    property var audioIcon: Audio.muted ? "" : ( Audio.volume < 0.25 ? "" : ( Audio.volume < 0.75 ? "" : ""))

    IconButton {
        text: endRow.audioIcon + "   " + Math.round(100 * Audio.volume) + "%"
        fontSize: 17
        buttonWidth: 70
        onClicked: {
            console.log("sound clicked");
        }
    }

    

    
}