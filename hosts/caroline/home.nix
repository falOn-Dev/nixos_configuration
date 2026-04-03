{ config, ... }:
{
    flake.nixosModules.home-caroline = { pkgs, ... }: {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.users.falon.imports =
            with config.flake.homeModules; [
                home-falon-base
                home-falon-git
                home-falon-zsh
            ];
    };
}
