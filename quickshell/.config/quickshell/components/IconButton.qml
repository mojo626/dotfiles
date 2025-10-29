import QtQuick
import Quickshell
import qs.config

Item {
    id: controlCenter

    required property int buttonWidth

    height: endRow.height
    width: this.buttonWidth

    required property int fontSize
    required property var text
    
    signal clicked()

    property int currentFontSize: fontSize

    Text {
        text: controlCenter.text
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: controlCenter.currentFontSize

        color: ColorsConfig.palette.current.text
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: controlCenter.clicked()
        onEntered: event => {
            controlCenter.currentFontSize = controlCenter.fontSize + 3;
        }
        onExited: event => {
            controlCenter.currentFontSize = controlCenter.fontSize;
        }
    }
}