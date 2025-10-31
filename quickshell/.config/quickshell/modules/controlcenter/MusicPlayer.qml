import Quickshell
import QtQuick
import QtQuick.Controls.Basic
import Quickshell.Services.Mpris
import qs.components
import qs.config
import qs.services
import QtQuick.Effects

Rectangle {
    id: root

    property var player: Mpris.players.values[0]

    visible: player != null

    width: parent.width - 150
    height: baseColumn.implicitHeight + 20


    anchors.horizontalCenter: parent.horizontalCenter

    color: "#202020"

    radius: 10

    // Image {
    //     id: backgroundImage
    //     source: root.player.trackArtUrl
    //     anchors.fill: parent
    // }

    // ShaderEffect {
    //     width: backgroundImage.width; height: backgroundImage.height
    //     property variant src: backgroundImage
    //     fragmentShader: "./gausian.qsb"
    // }

    Column {
        anchors.horizontalCenter: root.horizontalCenter
        anchors.top: parent.top
        anchors.margins: 10
        id: baseColumn

        Row {
            spacing: 30
            
            

            Image {
                source: root.player.trackArtUrl
                width: 80
                height: 80
            }

            Column {
                anchors.verticalCenter: parent.verticalCenter


                Text {
                    text: root.player.trackTitle
                    color: ColorsConfig.palette.current.text

                }

                Text {
                    text: root.player.trackArtist
                    color: ColorsConfig.palette.current.text
                }
            }

        }

        Slider {
            
            id: control
            property var playbackPositon: 0.0

            value: playbackPositon

            anchors.horizontalCenter: parent.horizontalCenter

            onMoved: {
                var percent = control.value;
                var seconds = percent * root.player.length;

                root.player.position = seconds;
            }

            background: Rectangle {
                x: control.leftPadding
                y: control.topPadding + control.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 4
                width: control.availableWidth
                height: implicitHeight
                radius: 2
                color: "#bdbebf"

                Rectangle {
                    width: control.visualPosition * parent.width
                    height: parent.height
                    color: "#21be2b"
                    radius: 2
                }
            }

            handle: Rectangle {
                x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
                y: control.topPadding + control.availableHeight / 2 - height / 2
                implicitWidth: 26
                implicitHeight: 26
                radius: 13
                color: "transparent"
            }

            FrameAnimation {
                // only emit the signal when the position is actually changing.
                running: true
                // emit the positionChanged signal every frame.
                onTriggered: {
                    if (root.player != null) {
                        control.playbackPositon = root.player.position / root.player.length
                    }
                    
                }
            }
        }

        Row {
            height: 20

            anchors.horizontalCenter: parent.horizontalCenter

            spacing: 10            

            IconButton {
                buttonWidth: 25
                fontSize: 22
                text: "󰒮"
                onClicked: {
                    root.player.previous();
                }
            }

            IconButton {
                buttonWidth: 25
                fontSize: 22
                text: root.player.isPlaying ? "󰏤" : "󰐊" 
                onClicked: {
                    root.player.togglePlaying();
                }
            }

            IconButton {
                buttonWidth: 25
                fontSize: 22
                text: "󰒭"
                onClicked: {
                    root.player.next();
                }
            }

        }


    }
    

    

    
}