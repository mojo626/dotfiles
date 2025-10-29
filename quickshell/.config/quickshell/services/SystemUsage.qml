pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property real cpuPerc


    Timer {
        running: true
        interval: 5000
        repeat: true
        triggeredOnStart: true
    }
}