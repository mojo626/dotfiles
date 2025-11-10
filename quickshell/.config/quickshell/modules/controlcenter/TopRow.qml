import QtQuick
import Quickshell
import qs.config
import qs.services
import Quickshell.Widgets
import QtQuick.Layouts
import Quickshell.Io

RowLayout {
    width: parent.width
    height: 60

    spacing: 10

    Image {
        id: pfp

        source: "/home/" + UserInfo.user + "/.face"

        Layout.fillHeight: true
        Layout.alignment: Qt.AlignVCenter
        Layout.preferredWidth: pfp.height
    }


    ColumnLayout {
        
        Layout.fillHeight: true
        spacing: 0
        

        Text {
            Layout.alignment: Qt.AlignBottom
            color: ColorsConfig.palette.current.text

            text: UserInfo.user

        }

        Text {
            Layout.alignment: Qt.AlignTop
            color: ColorsConfig.palette.current.text

            text: UserInfo.uptime

        }
    }


    RowLayout {
        Layout.alignment: Qt.AlignRight

        height: 50
        width: 100

        Process {
            id: shutdownProc
            running: false
            command: ["shutdown", "now"]
        }

        Process {
            id: restartProc
            running: false
            command: ["reboot", "now"]
        }

        Process {
            id: logoutProc
            running: false
            command: ["hyprctl", "dispatch", "exit"]
        }

        Process {
            id: sleepProc
            running: false
            command: ["systemctl", "suspend"]
        }

        PowerButton {
            icon: "󰤄"
            
            onClicked: {
                sleepProc.running = true;
            }
        }

        PowerButton {
            icon: "󰗽"
            
            onClicked: {
                logoutProc.running = true;
            }
        }

        PowerButton {
            icon: ""
            
            onClicked: {
                restartProc.running = true;
            }
        }

        PowerButton {
            icon: ""
            
            onClicked: {
                shutdownProc.running = true; 
            }
        }
    }
    
    
    
}