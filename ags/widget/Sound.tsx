import { Gtk } from "ags/gtk4"
import { createState } from "ags"
import { icon } from "astal"

// Function to get the current volume
function getVolume() {
  try {
    const output = exec("pactl get-sink-volume @DEFAULT_SINK@").trim();
    const match = output.match(/(\d+)%/);
    return match ? parseInt(match[1]) : 0;
  } catch {
    return 0;
  }
}

// Bind volume variable
const [volume, setVolume2] = createState();

// Function to set volume
function setVolume(change) {
  exec(`pactl set-sink-volume @DEFAULT_SINK@ ${change}%`);
  setVolume2(getVolume()); // Update the variable
}

export default function Sound() {
    return (
             <button
                halign={Gtk.Align.CENTER}
               
                >
                <box>
                    <label label={volume((v) => "hi " + v + "%")} />
                </box>
            </button>
        )
}
