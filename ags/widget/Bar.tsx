import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import Hyprland from "gi://AstalHyprland"
import { createBinding, createState, With } from "ags"
import Workspaces from "./Workspaces"
import Time from "./Time"
import ActiveWindow from "./ActiveWindow"

export default function Bar(gdkmonitor: Gdk.Monitor) {
  
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  const hyprland = Hyprland.get_default()

  const focusedTitle = createBinding(hyprland, "focused-client")



  return (
    <window
      visible
      name="bar"
      class="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
    >
      
      <centerbox cssName="centerbox">
        <box halign={Gtk.Align.START} $type="start">
            <Workspaces />
        </box>

        <box halign={Gtk.Align.CENTER} $type="center">
            <ActiveWindow />
        </box>

        <box halign={Gtk.Align.END} $type="end">
            <Time />
        </box>

      </centerbox>

      
    </window>
  )
}
