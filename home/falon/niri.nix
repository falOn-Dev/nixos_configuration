
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

            binds = {
                "Mod+Return".action.spawn = "ghostty";
                "Mod+Space".action.spawn-sh = [ "rofi" "-show" "drun" ];
                "Mod+Q".action.close-window = [];
            };
        };
    };
}
