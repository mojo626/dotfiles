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


    //maybe do a dropdown for the system tray like windows does?
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

                    Layout.margins: 7

                    Image {
                        source: modelData.icon

                        anchors.fill: parent
                        
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        acceptedButtons: Qt.AllButtons
                        onClicked: {
                            if (mouse.button == Qt.RightButton) {
                                modelData.display(barWindow, 0, 0);
                            } else if (mouse.button == Qt.LeftButton) {
                                modelData.activate();
                            } else if (mouse.button == Qt.MiddleButton) {
                                modelData.secondaryActivate();
                            }
                            
                        }
                        onEntered: event => {
                            
                        }
                        onExited: event => {
                            
                        }
                    }

                }
                
                    
            }

        }

        
    }

    

}

