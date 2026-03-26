
{ ... }:
{
    flake.nixosModules.desktop-niri = { pkgs, inputs, ... }: {

        nixpkgs.overlays = [ inputs.niri.overlays.niri ];

        programs.niri.enable = true;

        programs.niri.package = pkgs.niri-stable;

        services.displayManager.ly.enable = true;

        environment.systemPackages = with pkgs; [
            xwayland-satellite
            wl-clipboard
        ];
    };
}
