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
    id: root

    width: parent.width
    height: menuState == 0 ? 70 : 270

    property int fixedHeight: menuState == 0 ? 70 : 270 //doesn't animate

    Behavior on height {
        NumberAnimation {
            duration: 200
            easing.type: Easing.OutCubic
        }
    }

    spacing: 10

    property int menuState: 0 //0 = nothing, 1 = wifi expanded, 2 = BT expanded

    RowLayout {
        id: rootRow
        Layout.fillWidth: true
        Layout.maximumHeight: 60
        Layout.minimumHeight: 60

        spacing: 20

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            color: ColorsConfig.palette.current.primary_container

            radius: 15

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (menuState == 1) {
                        menuState = 0;
                    } else {
                        menuState = 1;
                    }
                }
                onEntered: event => {
                    //controlCenter.currentFontSize = controlCenter.fontSize + 3;
                }
                onExited: event => {
                    //controlCenter.currentFontSize = controlCenter.fontSize;
                }
            }

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
                    Layout.fillWidth: true

                    Text {
                        text: "Wifi"
                        color: ColorsConfig.palette.current.text

                        Layout.fillWidth: true
                    }

                    Text {
                        text: "Wifi"
                        color: ColorsConfig.palette.current.text

                        Layout.fillWidth: true
                    }
                }
                

                Text {
                    text: ""
                    color: ColorsConfig.palette.current.text

                    Layout.alignment: Qt.AlignRight

                    Layout.rightMargin: 10
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            color: ColorsConfig.palette.current.primary_container

            radius: 15

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (menuState == 2) {
                        menuState = 0;
                        Bluetooth.defaultAdapter.discovering = false;
                    } else {
                        menuState = 2;
                        Bluetooth.defaultAdapter.discovering = true;
                    }
                }
                onEntered: event => {
                    //controlCenter.currentFontSize = controlCenter.fontSize + 3;
                }
                onExited: event => {
                    //controlCenter.currentFontSize = controlCenter.fontSize;
                }
            }

            RowLayout {
                anchors.fill: parent


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

                    
                    Layout.fillWidth: true

                }

                Text {
                    text: ""
                    color: ColorsConfig.palette.current.text

                    Layout.alignment: Qt.AlignRight

                    Layout.rightMargin: 10
                }
            }
        }
        
        
        
        
    }

    //wifi
    Rectangle {
        Layout.fillWidth: true
        // Layout.preferredHeight: menuState == 1 ? 200 : 0
        visible: menuState == 1
        Layout.fillHeight: true

        color: "#ffffff"

    }

    //bluetooth
    Rectangle {
        id: btMenu

        Layout.fillWidth: true
        // Layout.preferredHeight: menuState == 1 ? 200 : 0
        visible: menuState == 2
        Layout.fillHeight: true

        color: ColorsConfig.palette.current.primary_container
        radius: 10

        property var btDevices: Bluetooth.defaultAdapter.devices


        Component.onCompleted: { 
            Bluetooth.defaultAdapter.powered = true;
            Bluetooth.defaultAdapter.discoverableTimeout = 0;
        }



        //original from: https://github.com/corecathx/whisker/blob/807610c160f2f81e42ff1316970bcd88dfefcd0e/windows/settings/BluetoothDeviceCard.qml#L5
        function mapBluetoothIcon(dbusIcon: string, name: string): string {
            console.log("hello");
            console.log(dbusIcon, ' / ', name)
            const iconMap = {
                "audio-headset": "󰋎",
                "audio-headphones": "󰋋",
                "input-keyboard": "󰌌",
                "input-mouse": "󰍽",
                "input-gaming": "󰮂",
                "phone": "",
                "computer": "󰍹",
                "printer": "󰐪",
                "camera": "󰄀",
                "unknown": "󰂯"
            }
            return iconMap[dbusIcon] || "󰂯";
        }

        ScrollView {
            anchors.fill: parent

            clip: true

            ListView {
                width: parent.width
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                anchors.margins: 10

                spacing: 10

                model: btMenu.btDevices.values.filter(a => a.deviceName)
                delegate: Rectangle {
                    height: 50
                    
                    anchors.left: parent.left
                    anchors.right: parent.right

                    anchors.margins: 10

                    radius: 5

                    color: ColorsConfig.palette.current.secondary_container

                    RowLayout {
                        anchors.fill: parent

                        

                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            Layout.preferredWidth: 5

                            text: btMenu.mapBluetoothIcon(modelData.icon, modelData.deviceName)

                            font.pixelSize: 20

                            color: ColorsConfig.palette.current.text
                        }

                        Text {
                            text: modelData.deviceName 

                            color: ColorsConfig.palette.current.text
                        }

                        Text {
                            text: modelData.state.toString() == BluetoothDeviceState.Connecting ? "󱦟" : modelData.state.toString() == BluetoothDeviceState.Connected ? "" : ""

                            color: ColorsConfig.palette.current.text
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            if (modelData.state.toString() == BluetoothDeviceState.Connected) {
                                modelData.disconnect()
                            } else if (modelData.state.toString() == BluetoothDeviceState.Disconnected) {
                                modelData.connect();
                            }   
                            
                        }
                        onEntered: event => {
                            //controlCenter.currentFontSize = controlCenter.fontSize + 3;
                        }
                        onExited: event => {
                            //controlCenter.currentFontSize = controlCenter.fontSize;
                        }
                    }

                    
                }
            }
        }   
        


    }

}