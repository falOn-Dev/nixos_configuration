{ config, ... }:
{
    flake.nixosModules.home-prunes = { pkgs, ... }: {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.users.falon.imports =
            with config.flake.homeModules; [
                home-falon-base
                home-falon-git
                home-falon-neovim
                home-falon-niri
                home-falon-zsh
                home-falon-ghostty
                home-falon-firefox-nvidia
                home-falon-discord
            ];
    };
}
