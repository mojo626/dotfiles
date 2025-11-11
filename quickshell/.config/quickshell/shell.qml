//@ pragma UseQApplication

import Quickshell // for PanelWindow
import QtQuick // for Text
import Quickshell.Io
import Quickshell.Hyprland
import "modules/bar"
import "modules/controlcenter"
import "modules/launcher"
import "modules/volumeosd"

Scope {
	id: shellroot

	property var showControlCenter: false
	property var showLauncher: false

	Bar {}	
	ControlCenter {}
	Launcher {}

	VolumeOSD {}

	GlobalShortcut {
		appid: "bar"
		name: "launcher"
		description: "Toggle launcher"
		onPressed: shellroot.showLauncher = !shellroot.showLauncher
	}
}
