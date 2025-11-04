import Quickshell
import QtQuick
import qs.config
import QtQuick.Layouts

Rectangle {
    id: root

    Layout.preferredHeight: text.implicitHeight + 10
    Layout.preferredWidth: text.implicitWidth + 20

    color: ColorsConfig.palette.current.primary_container

    radius: 10

    property int baseFontSize: 20

    required property string icon

    signal clicked

    Text {
        id: text
        text: root.icon

        anchors.fill: parent

        anchors.margins: 5

        anchors.leftMargin: 10

        font.pixelSize: parent.baseFontSize

        color: ColorsConfig.palette.current.text
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            root.clicked();
        }
        onEntered: event => {
            parent.color = ColorsConfig.palette.current.secondary_container;
        }
        onExited: event => {
            parent.color = ColorsConfig.palette.current.primary_container;
        }
    }
}