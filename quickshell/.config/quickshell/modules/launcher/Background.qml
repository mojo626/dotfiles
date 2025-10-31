import QtQuick
import QtQuick.Shapes
import qs.config

Shape {
    id: root

    property int radius: 25
    readonly property bool flatten: parentRect.height < radius * 2
    readonly property real radiusY: flatten ? parentRect.height / 2 : radius
    required property Rectangle parentRect

    x: parentRect.width - radius * 2
    y: parentRect.height

    ShapePath {
        

        fillColor: ColorsConfig.palette.current.bar_background /*"#00ff00"*/

        strokeWidth: -1
        //strokeColor: "#ff0000"


        PathArc {
            relativeX: root.radius
            relativeY: -root.radiusY
            radiusX: root.radius
            radiusY: Math.min(root.radius, root.parentRect.height)
            direction: PathArc.Counterclockwise
        }

        PathLine {
            relativeX: 0
            relativeY: -(root.parentRect.height - root.radiusY * 2)
        }

        PathArc {
            relativeX: root.radius
            relativeY: -root.radiusY
            radiusX: root.radius
            radiusY: Math.min(root.radius, root.parentRect.height)
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
            radiusY: Math.min(root.radius, root.parentRect.height)
            direction: PathArc.Clockwise
        }

        PathLine {
            relativeX: 0
            relativeY: (root.parentRect.height - root.radiusY * 2)
        }

        PathArc {
            relativeX: root.radius
            relativeY: root.radiusY
            radiusX: root.radius
            radiusY: Math.min(root.radius, root.parentRect.height)
            direction: PathArc.Counterclockwise
        }

        PathLine {
            relativeX: root.parentRect.width - root.radius * 4
            relativeY: 0
        }

    }
}

