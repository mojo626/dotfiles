import QtQuick
import QtQuick.Shapes
import qs.config

Shape {
    id: root

    property int radius: 25
    readonly property bool flatten: menuHeight < radius * 2
    readonly property real radiusY: flatten ? menuHeight / 2 : radius
    required property Rectangle parentRect

    required property int menuHeight

    property var animationRunning: false

    signal expanding
    signal retracted

    x: parentRect.width - radius * 2
    y: menuHeight

    Behavior on menuHeight {
        NumberAnimation { 
            duration: 300
            easing.type: Easing.OutCubic 
            onRunningChanged: {
                animationRunning = !animationRunning
                if (!animationRunning && root.menuHeight == 0) {
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


        PathArc {
            relativeX: root.radius
            relativeY: -root.radiusY
            radiusX: root.radius
            radiusY: Math.min(root.radius, root.menuHeight)
            direction: PathArc.Counterclockwise
        }

        PathLine {
            relativeX: 0
            relativeY: -(root.menuHeight - root.radiusY * 2)
        }

        PathArc {
            relativeX: root.radius
            relativeY: -root.radiusY
            radiusX: root.radius
            radiusY: Math.min(root.radius, root.menuHeight)
            direction: PathArc.Clockwise
        }

        PathLine {
            relativeX: -root.parentRect.width
            relativeY: 0
        }

        PathArc {
            relativeX: root.radius
            relativeY: root.radiusY
            radiusX: root.radius
            radiusY: Math.min(root.radius, root.menuHeight)
            direction: PathArc.Clockwise
        }

        PathLine {
            relativeX: 0
            relativeY: (root.menuHeight - root.radiusY * 2)
        }

        PathArc {
            relativeX: root.radius
            relativeY: root.radiusY
            radiusX: root.radius
            radiusY: Math.min(root.radius, root.menuHeight)
            direction: PathArc.Counterclockwise
        }

        PathLine {
            relativeX: root.parentRect.width - root.radius * 4
            relativeY: 0
        }

    }
}

