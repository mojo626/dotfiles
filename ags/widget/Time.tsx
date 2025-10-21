import { Gtk } from "ags/gtk4"
import { createPoll } from "ags/time"


export default function Time() {
    const time = createPoll("", 1000, "date")

    return (
        <button halign={Gtk.Align.CENTER}>
            <label label={time} />
            {/* <popover>
                <Gtk.Calendar />
            </popover> */}
        </button>
    )
}

