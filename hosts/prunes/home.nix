{ config, ... }:
{
    flake.nixosModules.home-prunes = { ... }: {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.users.falon.imports =
            with config.flake.homeModules; [
                home-falon-base
            ];
    };
}
