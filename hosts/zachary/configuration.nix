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

        nix.settings.experimental-features = "nix-command flakes";

        programs.firefox.enable = true;

        environment.systemPackages = with pkgs; [
            git
            neovim
            unzip
            networkmanager
            networkmanager-openvpn
            openvpn
        ];

        imports = with config.flake.nixosModules; [
            desktop-i3
        ]; 

        fonts.packages = with pkgs; [
            nerd-fonts.hurmit
        ];
    };
}
