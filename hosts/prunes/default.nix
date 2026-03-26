{ config, inputs, ... }:
{
    flake.nixosConfigurations.tatiman-prunes = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
            inherit inputs;
        };

        modules = with config.flake.nixosModules; [
            inputs.niri.nixosModules.niri
            inputs.home-manager.nixosModules.home-manager

            configuration-prunes
            hardware-prunes
            home-prunes
            user-falon

        ];
    };
}
