import { createBinding, createComputed, createState, With } from "ags";
import Hyprland from "gi://AstalHyprland";
const hyprland = Hyprland.get_default();

function trimClientTitle(title: string) {
  if (title.length > 50) {
    return title.slice(0, 50) + "...";
  } else {
    return title;
  }
}

export default function ActiveWindow() {
    const focusedClient = createBinding(hyprland, "focused_client");

    const focusedTitle = createComputed((get) => createBinding(get(focusedClient), "title"));

    return (
        <box>
            <With value={focusedClient}>
                {(focusedClient) => {
                    if (focusedClient) {
                        if (focusedClient.title) {
                            const titleBinding = createBinding(focusedClient, "title");
                            return (

                                <box>
                                    <button>
                                        <label label={trimClientTitle(focusedClient.title)} />
                                    </button>
                                </box>

                            );
                        } 
                    } else {
                            return <box />;
                    }
                }}
            </With>
            
        </box>
    );
}