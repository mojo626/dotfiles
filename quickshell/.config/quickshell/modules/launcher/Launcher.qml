import Quickshell
import QtQuick
import qs.config
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick.Controls
import Quickshell.Wayland

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
        
        property int appHeight: 300
        property int calcHeight: 100

        property bool firstOpen: true


        property int currentHeight: appHeight


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

        WlrLayerShell.keyboardFocus: WlrKeyboardFocus.Exclusive


        property var matches: []
        property var matchData: []
        property var appList: DesktopEntries.applications.values.map(a => a.name)
        property var appDataList: DesktopEntries.applications.values
        property var searchQuery: ""

        property string calcResult: ""

        //process to run to find apps with search query. Uses the fzf command-line tool for fuzzyfinding
        Process {
            id: fzfProc
            running: true
            command: ["sh", "-c", "echo '" + appList.join("\n") + "' | fzf --scheme=default -f '" + searchQuery + "'"]

            stdout: StdioCollector {
                onStreamFinished: {
                    const result = this.text.trim().split("\n");

                    if (result == "") {
                        matches = [];
                        matchData = [];
                        return;
                    }
                    
                    
                    const resultData = result.map(result => appDataList.find(app => app.name === result )).filter(app => !app.noDisplay);

                    matchData = resultData;
                    matches = resultData.map(a => a.name);

                    //console.log(matchData.map(a => Quickshell.iconPath(a.icon) ));
                }
            }
        }

        Process {
            id: calcProc
            running: false
            command: ["qalc", "'" + searchQuery.substring(1) + "'"]

            stdout: StdioCollector {
                onStreamFinished: {
                    calcResult = this.text;
                }
            }
        }

        Rectangle {
            id: backgroundRect

            color: "transparent"

            anchors.fill: parent

           //the background with rounded corners and fillets
            Background {
                id: background
                parentRect: backgroundRect
                menuHeight: shellroot.showLauncher ? window.currentHeight : 0

                //animating the height of the window lead to bad animations, so it has to be done in the Shape component
                //this logic is used to hide the window when the bar is closed so you can click on things behind it
                onExpanding: {
                    if (firstOpen) {
                        window.currentHeight = window.appHeight;
                        window.implicitHeight = window.appHeight;
                        searchBar.text = "";
                        window.searchQuery = ""
                        fzfProc.running = true;
                        firstOpen = false;
                    }
                    
                }
                onRetracted: {
                    window.implicitHeight = 0;
                    firstOpen = true;
                }
            }

            //this rect is used to clip the content so it is smoothly animated
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
                                Qt.callLater(() => {
                                    window.searchQuery = searchBar.text;

                                    if (window.searchQuery.length > 0 && window.searchQuery[0] == "=") {
                                        matches = [];
                                        matchData = [];
                                        window.currentHeight = window.calcHeight;
                                        calcProc.running = true;
                                        calcRect.visible = true;
                                        appRect.visible = false;
                                    } else {
                                        fzfProc.running = true;
                                        calcRect.visible = false;
                                        appRect.visible = true;
                                        window.currentHeight = window.appHeight;
                                    }
                                })
                                

                                
                            }

                            onAccepted: {
                                matchData[0].execute();
                                shellroot.showLauncher = false;
                            }

                            focus: true
                        }

                    }

                    Rectangle {
                        id: calcRect

                        height: parent.height - 35
                        width: parent.width

                        color: "transparent"

                        Text {
                            text: window.calcResult
                            color: ColorsConfig.palette.current.text

                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    
                    ScrollView {
                        id: appRect

                        height: parent.height - 35 //(35) is the height of the seach bar + padding, should probably change this
                        
                        width: parent.width - 50

                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 50
                        anchors.rightMargin: 50

                        clip: true

                        ListView {
                            height: 100
                            width: 100

                            model: window.matchData
                            delegate: Rectangle {
                                height: 50

                                Row {
                                    spacing: 15

                                    Image {
                                        anchors.verticalCenter: parent.verticalCenter

                                        width: 20
                                        height: 20

                                        source: Quickshell.iconPath(modelData.icon)
                                    }

                                    Text {
                                        text: modelData.name
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

}