{ config, ... }:
{
    flake.nixosModules.configuration-zachary =
    { pkgs, ... }:
    {
        networking.hostName = "tatiman-zachary";
        networking.networkmanager.enable = true;

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        system.stateVersion = "25.11";

        programs.firefox.enable = true;

        environment.systemPackages = with pkgs; [
            git
            neovim
        ];

        imports = with config.flake.nixosModules; [
            desktop-i3
        ]; 

        fonts.packages = with pkgs; [
            nerd-fonts.hurmit
        ];
    };
}
