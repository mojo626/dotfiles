import Quickshell
import QtQuick
import qs.config
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick.Controls

Variants {
    model: Quickshell.screens;

    id: root

    


    PanelWindow {
        id: window

        required property var modelData
        screen: modelData

        visible: true

        exclusionMode: ExclusionMode.Ignore

        anchors {
            top: true

        }

        margins.top: 30

        focusable: true
        
        property int initialHeight: 300

        color: "transparent"

        implicitHeight: 0  
        implicitWidth: 700 

        //this grabs focus when the launcher is opened so you can immediately type to search
        HyprlandFocusGrab {
            id: grab
            active: shellroot.showLauncher
            windows: [ window ] 

            onCleared: {
                shellroot.showLauncher = false; //close launcher if something else on screen is clicked
            }
        }


        property var matches: []
        property var matchData: []
        property var appList: DesktopEntries.applications.values.map(a => a.name)
        property var appDataList: DesktopEntries.applications.values
        property var searchQuery: ""

        Process {
            id: fzfProc
            running: true
            command: ["sh", "-c", "echo '" + appList.join("\n") + "' | fzf --scheme=default -f '" + searchQuery + "'"]

            stdout: StdioCollector {
                onStreamFinished: {
                    const result = this.text.trim().split("\n");
                    
                    

                    const resultData = result.map(result => appDataList.find(app => app.name === result )).filter(app => !app.noDisplay);

                    matchData = resultData;
                    matches = resultData.map(a => a.name);

                    console.log(matchData.map(a => a.execString ));
                }
            }
        }

        Rectangle {
            id: backgroundRect

            color: "transparent"

            anchors.fill: parent

           
            Background {
                id: background
                parentRect: backgroundRect
                menuHeight: shellroot.showLauncher ? window.initialHeight : 0
                onExpanding: {
                    window.implicitHeight = window.initialHeight;
                    searchBar.text = "";
                    fzfProc.running = true;
                }
                onRetracted: {
                    window.implicitHeight = 0;
                }
            }

            Rectangle {
                width: parent.width
                height: background.menuHeight
                
                color: "transparent"

                clip: true

                Column {
                    anchors.fill: parent

                    spacing: 10

                    Rectangle {
                        id: searchRect

                        width: parent.width - 50

                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 50
                        anchors.rightMargin: 50

                        height: 25
                        radius: 50

                        color: ColorsConfig.palette.current.primary_container

                        TextInput {
                            id: searchBar

                            width: parent.width

                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 20
                            anchors.rightMargin: 20

                            height: parent.height

                            verticalAlignment: TextInput.AlignVCenter

                            renderType: Text.NativeRendering

                            color: ColorsConfig.palette.current.text

                            wrapMode: TextInput.Wrap

                            onTextEdited: {
                                window.searchQuery = searchBar.text;
                                fzfProc.running = true;
                            }

                            onAccepted: {
                                matchData[0].execute();
                                shellroot.showLauncher = false;
                            }

                            focus: true
                        }

                    }

                    
                    ScrollView {
                        height: 400
                        
                        width: parent.width - 50

                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 50
                        anchors.rightMargin: 50

                        ListView {
                            height: 100
                            width: 100

                            model: window.matches
                            delegate: Rectangle {
                                height: 50

                                Text {
                                    text: modelData
                                    color: ColorsConfig.palette.current.text
                                }
                            }
                            
                            
                        }  
                    }   
                }
            }

            

            
            

                  


        }

        

    }

}