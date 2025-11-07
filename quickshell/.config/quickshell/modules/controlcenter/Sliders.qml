import QtQuick
import Quickshell
import qs.config
import qs.services
import Quickshell.Widgets
import QtQuick.Layouts
import Quickshell.Bluetooth
import QtQuick.Controls
import Quickshell.Io


ColumnLayout {
    id: rootColumn

    width: parent.width
    height: 60

    
    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true



        

        Text {
            property var audioIcon: Audio.muted ? "" : ( Audio.volume < 0.25 ? "" : ( Audio.volume < 0.75 ? "" : ""))

            id: text
            text: audioIcon

            Layout.preferredWidth: 40

            font.pixelSize: 20

            color: ColorsConfig.palette.current.text
        }

        Slider {
            Layout.fillWidth: true
            
            id: control
            property var volume: Audio.volume

            value: volume

            onMoved: {
                Audio.setVolume(control.value);
            }

            background: Rectangle {
                x: control.leftPadding
                y: control.topPadding + control.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 8
                width: control.availableWidth
                height: implicitHeight
                radius: 4
                color: "#bdbebf"

                Rectangle {
                    width: control.visualPosition * parent.width
                    height: parent.height
                    color: ColorsConfig.palette.current.slider
                    radius: 4
                }
            }

            handle: Rectangle {
                x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
                y: control.topPadding + control.availableHeight / 2 - height / 2
                implicitWidth: 18
                implicitHeight: 18
                radius: 13
                color: ColorsConfig.palette.current.text
            }

        }
    }
}