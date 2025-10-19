import Hyprland from "gi://AstalHyprland"
import { createBinding, With } from "ags";

export default function Workspaces() {
    const hypr = Hyprland.get_default();

    const workspaceBind = createBinding(hypr, "workspaces");


    return (<box>
            { workspaceBind.as((workspaces) => 
                <box>
                    {workspaces.map((ws: Hyprland.Workspaces) => {
                        console.log(ws.get_id().toString());
                        return <label label={ws.get_id().toString()}/>
                    })}
                </box>
            )}  
        </box>)

}