import QtQuick
import Quickshell
import qs.config
import qs.services

Row {
    width: parent.width
    height: 30

    Text {
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        height: parent.height
        color: ColorsConfig.palette.current.text

        text: UserInfo.uptime
    }
}