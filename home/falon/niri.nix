
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
    };
}
