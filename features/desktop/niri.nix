
{ ... }:
{
    flake.nixosModules.desktop-niri = { pkgs, inputs, ... }: {

        nixpkgs.overlays = [ inputs.niri.overlays.niri ];

        programs.niri.enable = true;
        programs.niri.package = pkgs.niri;

        services.displayManager.ly.enable = true;

        xdg.portal = {
            enable = true;

            extraPortals = with pkgs; [
                xdg-desktop-portal-gtk
                    xdg-desktop-portal-gnome
            ];

            config = {
                common = {
                    default = [ "gtk" ];
                    "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
                };
            };
        };

        programs.thunar = {
            enable = true;
            plugins = with pkgs.xfce; [
                thunar-archive-plugin
                thunar-volman
            ];
        };

        programs.xfconf.enable = true;

        services.gvfs.enable = true;
        services.tumbler.enable = true;

        environment.systemPackages = with pkgs; [
            xwayland-satellite
            wl-clipboard 
            xdg-desktop-portal
            xdg-desktop-portal-gtk
            xdg-desktop-portal-gnome
        ];
    };
}
