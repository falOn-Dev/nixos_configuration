{ config, ... }:
{
    flake.nixosModules.home-zachary = { ... }: {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.users.falon.imports =
            with config.flake.homeModules; [
                home-falon-base
                home-falon-git
                home-falon-neovim
                home-falon-i3
            ];
    };
}
