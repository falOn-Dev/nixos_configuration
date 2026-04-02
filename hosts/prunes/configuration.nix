{ config, ... }:
{
    flake.nixosModules.configuration-prunes =
    { pkgs, ... }:
    {
        networking.hostName = "tatiman-prunes";
        networking.networkmanager.enable = true;
        networking.networkmanager.plugins = with pkgs; [
            networkmanager-openvpn
        ];

        hardware.bluetooth.enable = true;

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        system.stateVersion = "25.11";

        nixpkgs.config.allowUnfree = true;
        time.timeZone = "America/New_York";

        nix.settings.experimental-features = "nix-command flakes";


        environment.systemPackages = with pkgs; [
            git
            neovim
            gcc
            rustc
            cargo
            unzip
            psmisc
            zip
            networkmanager
            networkmanager-openvpn
            openvpn
        ];

        imports = with config.flake.nixosModules; [
            desktop-niri
            app-steam
        ];

        fonts.packages = with pkgs; [
            nerd-fonts.hurmit
        ];
    };
}
