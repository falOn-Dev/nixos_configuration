
{ ... }:

{
    flake.homeModules.home-falon-niri = { config, pkgs, ... }: {
        home.packages = with pkgs; [
                ghostty
                rofi
                pywal16
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

                "Mod+O".action.toggle-overview = [];
                "Mod+F".action.maximize-column = [];

                "Mod+Shift+H".action.show-hotkey-overlay = [];
            };
        };
    };
}
