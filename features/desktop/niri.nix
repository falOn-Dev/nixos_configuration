
{ ... }:
{
    flake.nixosModules.desktop-niri = { pkgs, ... }: {

        programs.niri.enable = true

        services.displayManager.ly.enable = true;

        environment.systemPackages = with pkgs; [
            xwayland-satellite
            wl-clipboard
        ];
    };
}
