{ ... }:

{
    flake.homeModules.home-falon-i3 = { config, pkgs, ... }: {
        home.packages = with pkgs; [
            ghostty
                rofi
                autotiling
                pywal16
                feh
        ];

        xsession.windowManager.i3 = {
            enable = true;
            config = {
                modifier = "Mod4";

                terminal = "ghostty";

                menu = "rofi";

                keybindings =
                    let
                    mod = config.xsession.windowManager.i3.config.modifier;
                term = config.xsession.windowManager.i3.config.terminal;
                menu = config.xsession.windowManager.i3.config.menu;
                in
                {
                    "${mod}+Return" = "exec ${term}";
                    "${mod}+q" = "kill";
                    "${mod}+space" = "exec ${menu} -show drun";
                    "${mod}+Shift+w" = "exec ${config.home.homeDirectory}/scripts/wallpaper_selector.sh";

                    "${mod}+h" = "focus left";
                    "${mod}+j" = "focus down";
                    "${mod}+k" = "focus up";
                    "${mod}+l" = "focus right";

                    "${mod}+Shift+c" = "reload";
                    "${mod}+Shift+r" = "restart";

                    "${mod}+1" = "workspace number 1";
                    "${mod}+2" = "workspace number 2";
                    "${mod}+3" = "workspace number 3";
                    "${mod}+4" = "workspace number 4";
                    "${mod}+5" = "workspace number 5";
                    "${mod}+6" = "workspace number 6";
                    "${mod}+7" = "workspace number 7";
                    "${mod}+8" = "workspace number 8";
                    "${mod}+9" = "workspace number 9";
                    "${mod}+10" = "workspace number 10";
                };

                startup = [
                {
                    command = "${pkgs.autotiling}/bin/autotiling";
                    always = true;
                }
                {
                    command = "wal -i ${config.home.homeDirectory}/.config/walls/selected";
                    always = true;
                }
                ];

                window = {
                    titlebar = false;
                };
                gaps = {
                    inner = 10;
                    outer = 10;
                };
            };
        };
    };
}
