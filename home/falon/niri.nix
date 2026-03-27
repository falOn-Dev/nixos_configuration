
{ ... }:

{
    flake.homeModules.home-falon-niri = { config, pkgs, ... }: {
        home.packages = with pkgs; [
                ghostty
                rofi
                grim
                slurp
                swaybg
                swaylock
                mako
                swayidle
                waybar
        ];

        programs.niri.settings = {
            prefer-no-csd = true;

            input = {
                keyboard.xkb.layout = "us";
                focus-follows-mouse.enable = true;
            };

            layout = {
                gaps = 6;
            };

            outputs."eDP-1" = {
                mode = {
                    height = 1080;
                    width = 1920;
                    refresh = 60.0;
                };
                position = {
                    x = 0;
                    y = 0;
                };
            };

            outputs."HDMI-A-2" = {
                mode = {
                    height = 1080;
                    width = 1920;
                    refresh = 60.0;
                };
                position = {
                    x = 1920;
                    y = 0;
                };
            };

            binds = {
                "Mod+Return".action.spawn = "ghostty";
                "Mod+Space".action.spawn = [ "rofi" "-show" "drun" ];
                "Mod+Q".action.close-window = [];

                "Mod+H".action.focus-column-left = [];
                "Mod+L".action.focus-column-right = [];
                "Mod+J".action.focus-window-or-workspace-down = [];
                "Mod+K".action.focus-window-or-workspace-up = [];
                
                "Mod+Shift+H".action.move-column-left = [];
                "Mod+Shift+L".action.move-column-right = [];
                "Mod+Shift+J".action.move-column-to-workspace-down = [];
                "Mod+Shift+K".action.move-column-to-workspace-up = [];

                "Mod+Shift+P".action.spawn-sh = "~/scripts/wallpaper_selector.sh";

                "Mod+Alt+H".action.focus-monitor-left = [];
                "Mod+Alt+L".action.focus-monitor-right = [];

                "Mod+Shift+Alt+H".action.move-window-to-monitor-left = [];
                "Mod+Shift+Alt+L".action.move-window-to-monitor-right = [];

                "Mod+O".action.toggle-overview = [];
                "Mod+F".action.maximize-column = [];

                "Mod+1".action.focus-workspace = 1;
                "Mod+2".action.focus-workspace = 2;
                "Mod+3".action.focus-workspace = 3;
                "Mod+4".action.focus-workspace = 4;
                "Mod+5".action.focus-workspace = 5;
                "Mod+6".action.focus-workspace = 6;
                "Mod+7".action.focus-workspace = 7;
                "Mod+8".action.focus-workspace = 8;
                "Mod+9".action.focus-workspace = 9;
                "Mod+0".action.focus-workspace = 10;

                "Mod+Shift+1".action.move-window-to-workspace = 1;
                "Mod+Shift+2".action.move-window-to-workspace = 2;
                "Mod+Shift+3".action.move-window-to-workspace = 3;
                "Mod+Shift+4".action.move-window-to-workspace = 4;
                "Mod+Shift+5".action.move-window-to-workspace = 5;
                "Mod+Shift+6".action.move-window-to-workspace = 6;
                "Mod+Shift+7".action.move-window-to-workspace = 7;
                "Mod+Shift+8".action.move-window-to-workspace = 8;
                "Mod+Shift+9".action.move-window-to-workspace = 9;
                "Mod+Shift+0".action.move-window-to-workspace = 10;

            };
        };
    };
}
