pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property real cpuPerc
    property real usedRam
    property real totalRam

    Process {
        id: cpuProc

        command: ["sh", "-c", "top -b -n 1 | grep ^%Cpu | awk '{print $2}'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.cpuPerc = this.text
        }
    }

    Process {
        id: usedRamProc

        command: ["sh", "-c", "top -b -n 1 | grep 'MiB Mem' | awk '{print $8}'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.usedRam = this.text
        }
    }

    Process {
        id: totalRamProc

        command: ["sh", "-c", "top -b -n 1 | grep 'MiB Mem' | awk '{print $4}'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.totalRam = this.text
        }
    }


    Timer {
        running: true
        interval: 2000
        repeat: true
        triggeredOnStart: true
        onTriggered: { cpuProc.running = true; usedRamProc.running = true }
    }
}