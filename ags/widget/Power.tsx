import { Gtk } from "ags/gtk4"
import { exec } from "ags/process"


export default function Power() {

    return (
        <button halign={Gtk.Align.CENTER} onClicked={() => exec("hyprctl dispatch exit")}>
            <label label="" />
            {/* <popover>
                <Gtk.Calendar />
            </popover> */}
        </button>
    )
}
