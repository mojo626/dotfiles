import Quickshell // for PanelWindow
import QtQuick // for Text
import Quickshell.Io
import "modules/bar"
import "modules/controlcenter"

Scope {
	id: shellroot

	property var showControlCenter: true

	Bar {}	
	ControlCenter {}
}
