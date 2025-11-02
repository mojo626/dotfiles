import QtQuick
import Quickshell
import qs.config
import qs.services
import Quickshell.Widgets
import QtQuick.Layouts

RowLayout {
    width: parent.width
    height: 60

    spacing: 20

    Rectangle {
        Layout.fillWidth: true
        Layout.fillHeight: true

        color: ColorsConfig.palette.current.primary_container

        radius: 15

        RowLayout {
            anchors.fill: parent

            spacing: 10
            

            Rectangle {
                Layout.fillHeight: true
                Layout.preferredWidth: parent.height

                color: ColorsConfig.palette.current.secondary_container

                radius: 15


                Layout.margins: 5


                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    text: "󰤨"
                    color: ColorsConfig.palette.current.text
                    font.pixelSize: 30
                }
            }
            
            ColumnLayout {
                anchors.verticalCenter: parent.verticalCenter

                Text {
                    text: "Wifi"
                    color: ColorsConfig.palette.current.text
                }

                Text {
                    text: "Wifi"
                    color: ColorsConfig.palette.current.text
                }
            }
            

            Text {
                text: ""
                color: ColorsConfig.palette.current.text
            }
        }
    }

    Rectangle {
        Layout.fillWidth: true
        Layout.fillHeight: true

        color: ColorsConfig.palette.current.primary_container

        radius: 15

        RowLayout {
            anchors.fill: parent

            spacing: 10

            Rectangle {
                Layout.fillHeight: true
                Layout.preferredWidth: parent.height

                color: ColorsConfig.palette.current.secondary_container

                radius: 15


                Layout.margins: 5


                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    text: "󰂯"
                    color: ColorsConfig.palette.current.text
                    font.pixelSize: 30
                }
            }
            

            Text {
                text: "Bluetooth"
                color: ColorsConfig.palette.current.text
            }

            Text {
                text: ""
                color: ColorsConfig.palette.current.text
            }
        }
    }
    
    
    
    
}