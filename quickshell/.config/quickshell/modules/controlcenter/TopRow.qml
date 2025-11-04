import QtQuick
import Quickshell
import qs.config
import qs.services
import Quickshell.Widgets
import QtQuick.Layouts
import Quickshell.Io

Row {
    width: parent.width
    height: 60

    spacing: 10

    Image {
        source: "/home/" + UserInfo.user + "/.face"
        sourceSize.width: 50
    }


    Column {
        
        height: parent.height
        spacing: 5
        

        Text {
            horizontalAlignment: Text.AlignHCenter
            color: ColorsConfig.palette.current.text
            height: parent.height/2

            text: UserInfo.user
        }

        Text {
            horizontalAlignment: Text.AlignHCenter
            color: ColorsConfig.palette.current.text
            height: parent.height/2

            text: UserInfo.uptime
        }
    }


    RowLayout {
        anchors.verticalCenter: parent.verticalCenter

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