{ ... }:
{
    flake.nixosModules.desktop-i3 = { pkgs, ... }: {
        services.xserver.enable = true;

        services.xserver.xkb.layout = "us";
        services.xserver.windowManager.i3.enable = true;

        services.displayManager.ly.enable = true;

        environment.systemPackages = with pkgs; [
            i3blocks
            ghostty
            rofi
        ];
    };
}
