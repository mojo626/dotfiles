pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string user
    property string uptime
    
    Process {
        id: userProc

        command: ["bash", "-c", "whoami | tr -d '\n'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.user = this.text
        }
    }

    Process {
        id: uptimeProc

        command: ["bash", "-c",
        "uptime | awk -F'( |,|:)+' '{d=h=m=0; if ($7==\"min\") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,\"days,\",h+0,\"hours,\",m+0,\"minutes.\"}' | tr -d '\n'"
        ]

        stdout: StdioCollector {
            onStreamFinished: root.uptime = this.text
        }
    }
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: { userProc.running = true; uptimeProc.running = true;}
    }
}