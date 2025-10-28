pragma Singleton

import Quickshell // for PanelWindow
import QtQuick // for Text
import Quickshell.Io

Singleton {
    id: root
    
    // an expression can be broken across multiple lines using {}
    readonly property string time: {
        // The passed format string matches the default output of
        // the `date` command.
        Qt.formatDateTime(clock.date, "MMM d h:mm:ss AP")
    }

	  SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}