import QtQuick
import qs.config
import Quickshell.Services.SystemTray
import QtQuick.Layouts



RowLayout {
    anchors.fill: parent

    spacing: 20

    Workspaces {
        //Layout.fillWidth: true
        Layout.fillHeight: true

        Layout.leftMargin: 20

        id: ws
    }



    Rectangle {
        Layout.fillWidth: true
        Layout.fillHeight: true

        color: "transparent"


        RowLayout {
            height: parent.height

            Repeater {

                model: SystemTray.items
                delegate: Rectangle {

                    id: trayRect

                    Layout.fillHeight: true
                    Layout.preferredWidth: trayRect.height

                    radius: 100

                    Layout.margins: 5

                    Image {
                        source: modelData.icon

                        anchors.fill: parent
                        
                    }

                }
                
                    
            }

        }

        
    }

    

}

