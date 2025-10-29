import QtQuick
import qs.services
import qs.config

Text {
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    anchors.fill: parent

    text: Time.time 

    color: ColorsConfig.palette.current.text
}