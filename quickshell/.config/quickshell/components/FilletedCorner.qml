import QtQuick
import Quickshell
import QtQuick.Shapes
import qs.config


Shape {
    id: root
    required property int radius


    width: radius
    height: radius

    property string color: ColorsConfig.palette.current.bar_background
    property int xOffset: 0
    property int yOffset: 0

    x: xOffset
    y: yOffset

    ShapePath {
        

        strokeWidth: 0
        fillColor: root.color

        startX: 0
        startY: 0

        

        joinStyle: ShapePath.BevelJoin

        PathLine { 
            x: root.radius
            y: 0
        }

        PathAngleArc {
            centerX: 0
            centerY: root.radius

            radiusX: root.radius
            radiusY: root.radius

            startAngle: 270
            sweepAngle: 90
        }

        PathLine { 
            x: root.radius
            y: 0
        }
    }


}