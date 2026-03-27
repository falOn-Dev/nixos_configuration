{ config, ... }:
{
    flake.nixosModules.configuration-prunes =
    { pkgs, ... }:
    {
        networking.hostName = "tatiman-prunes";
        networking.networkmanager.enable = true;

        hardware.bluetooth.enable = true;

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        system.stateVersion = "25.11";

        nixpkgs.config.allowUnfree = true;

        nix.settings.experimental-features = "nix-command flakes";

        programs.firefox.enable = true;

        environment.systemPackages = with pkgs; [
            git
            neovim
            gcc
            rustc
            cargo
        ];

        imports = with config.flake.nixosModules; [
            desktop-niri
        ];

        fonts.packages = with pkgs; [
            nerd-fonts.hurmit
        ];
    };
}
