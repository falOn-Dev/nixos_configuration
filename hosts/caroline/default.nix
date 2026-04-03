{ config, inputs, ... }:
{
    flake.nixosConfigurations.tatiman-caroline = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
            inherit inputs;
        };

        modules = with config.flake.nixosModules; [
            inputs.niri.nixosModules.niri
            inputs.home-manager.nixosModules.home-manager
            inputs.disko.nixosModules.disko

            config.flake.diskoConfigurations.tatiman-caroline

            configuration-caroline
            hardware-caroline
            home-caroline
            user-falon

        ];
    };
}
