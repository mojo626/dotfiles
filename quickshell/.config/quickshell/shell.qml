import Quickshell // for PanelWindow
import QtQuick // for Text
import Quickshell.Io
import Quickshell.Hyprland
import "modules/bar"
import "modules/controlcenter"
import "modules/launcher"

Scope {
	id: shellroot

	property var showControlCenter: false
	property var showLauncher: true 

	Bar {}	
	ControlCenter {}
	Launcher {}

	GlobalShortcut {
		appid: "bar"
		name: "launcher"
		description: "Toggle launcher"
		onPressed: shellroot.showLauncher = !shellroot.showLauncher
	}
}
