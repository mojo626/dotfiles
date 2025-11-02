import QtQuick
import QtQuick.Shapes
import qs.config

Shape {
    id: root

    property int radius: 25
    readonly property bool flatten: menuWidth < radius * 3
    readonly property real radiusX: flatten ? menuWidth / 3 : radius
    required property Rectangle parentRect

    required property int menuWidth

    property var animationRunning: false

    signal expanding
    signal retracted

    x: parentRect.width
    y: 0

    Behavior on menuWidth {
        NumberAnimation { 
            duration: 300
            easing.type: Easing.OutCubic 
            onRunningChanged: {
                animationRunning = !animationRunning
                if (!animationRunning && root.menuWidth == 0) {
                    root.retracted()
                } else if (animationRunning) {
                    root.expanding()
                }
            }
        }
    }

    ShapePath {
        

        fillColor: ColorsConfig.palette.current.bar_background /*"#00ff00"*/

        strokeWidth: -1
        //strokeColor: "#ff0000"

        PathLine {
            relativeX: -(root.menuWidth)
            relativeY: 0
        }

        PathArc {
            relativeY: root.radius
            relativeX: root.radiusX
            radiusY: root.radius
            radiusX: Math.min(root.radiusX, root.radius)
            direction: PathArc.Clockwise
        }

        PathLine {
            relativeX: 0
            relativeY: (root.parentRect.height - root.radius * 3)
        }

        PathArc {
            relativeY: root.radius
            relativeX: root.radiusX
            radiusY: root.radius
            radiusX: Math.min(root.radiusX, root.radius)
            direction: PathArc.Counterclockwise
        }

        PathLine {
            relativeX: root.menuWidth - root.radiusX * 3
            relativeY: 0
        }

        PathArc {
            relativeY: root.radius
            relativeX: root.radiusX
            radiusY: root.radius
            radiusX: Math.min(root.radiusX, root.radius)
            direction: PathArc.Clockwise
        }

        PathLine {
            relativeX: 0
            relativeY: -root.parentRect.height
        }

        

    }
}

