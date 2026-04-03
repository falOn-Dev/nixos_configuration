{ config, ... }:
{
    flake.nixosModules.configuration-caroline =
    { pkgs, ... }:
    {
        networking.hostName = "tatiman-caroline";


        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        system.stateVersion = "25.11";

        nixpkgs.config.allowUnfree = true;
        time.timeZone = "America/New_York";

        nix.settings.experimental-features = "nix-command flakes";

        networking.networkmanager.enable = true;
        services.openssh.enable = true;

        environment.systemPackages = with pkgs; [
            git
            neovim
            gcc
            rustc
            cargo
            unzip
            psmisc
            zip
        ];

        imports = with config.flake.nixosModules; [
        ];

        fonts.packages = with pkgs; [
            nerd-fonts.hurmit
        ];
    };
}
