import Quickshell // for PanelWindow
import QtQuick
import QtQuick.Layouts
import "startpart"
import "middlepart"
import "endpart"

Scope {

	Variants {
		model: Quickshell.screens;


		PanelWindow {

			required property var modelData
      		screen: modelData

			anchors {
				top: true
				left: true
				right: true
			}

			implicitHeight: 30

			Rectangle {
				anchors.fill: parent

				GridLayout {
					anchors.fill: parent
					columns: 3
					rows: 1
					columnSpacing: 0

					Item {
						id: start
						Layout.fillWidth: true
						Layout.fillHeight: true

						StartPart {}
					}

					Item {
						id: middle
						Layout.fillWidth: true
						Layout.fillHeight: true

						MiddlePart {}
					}

					Item {
						id: end
						Layout.fillWidth: true
						Layout.fillHeight: true

						EndPart {}
					}
				}
			}
		}

	}


	

}
