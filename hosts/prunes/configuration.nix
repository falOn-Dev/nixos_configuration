{ config, ... }:
{
    flake.nixosModules.configuration-prunes =
    { pkgs, ... }:
    {
        networking.hostName = "tatiman-prunes";
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
        ];
    };
}
