import Hyprland from "gi://AstalHyprland"
import { createBinding, With } from "ags";

function InactiveWorkspace(props: { id: number }) {
  return (
    <button>
      <label label={props.id.toString()} />
    </button>
  );
}

function ActiveWorkspace(props: { id: number }) {
  return (
    <button>
      <label label={props.id.toString()} />
    </button>
  );
}

export default function Workspaces() {
    const hypr = Hyprland.get_default();

    const workspaceBind = createBinding(hypr, "workspaces");


    // return (<box>
    //         { workspaceBind.as((workspaces) => 
    //             <box>
    //                 {workspaces.map((ws: Hyprland.Workspaces) => {
    //                     console.log(ws.get_id().toString());
    //                     return <label label={ws.get_id().toString()}/>
    //                 })}
    //             </box>
    //         )}  
    //     </box>)

    return (
        <box>
        {createBinding(hypr, "workspaces").as((workspaces) => {
            //sort workspaces
            workspaces.sort((a, b) => a.get_id() - b.get_id());
            return (
            <box>
                {workspaces.map((workspaces) => {
                return createBinding(hypr, "focused_workspace").as(
                    (focused_workspace) => {
                    if (focused_workspace.get_id() === workspaces.get_id()) {
                        return (
                        <button
   
                           
                        >
                            <ActiveWorkspace id={focused_workspace.get_id()} />
                        </button>
                        );
                    }
                    return (
                        <button
   
                        
                        >
                        <InactiveWorkspace id={workspaces.get_id()} />
                        </button>
                    );
                    },
                );
                })}
            </box>
            );
        })}
        </box>
    );


}