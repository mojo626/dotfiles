import QtQuick
import Quickshell
import qs.config
import qs.services
import Quickshell.Widgets

Row {
    width: parent.width
    height: 30

    Image {
        source: "/home/" + UserInfo.user + "/.face"
        sourceSize.width: 50
    }


    Column {
        height: parent.height
        spacing: 5
        

        Text {
            horizontalAlignment: Text.AlignHCenter
            color: ColorsConfig.palette.current.text
            height: parent.height/2

            text: UserInfo.user
        }

        Text {
            horizontalAlignment: Text.AlignHCenter
            color: ColorsConfig.palette.current.text
            height: parent.height/2

            text: UserInfo.uptime
        }
    }
    
    
    
}