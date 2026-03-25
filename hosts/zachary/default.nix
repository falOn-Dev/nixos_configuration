{ config, inputs, ... }:
{
    flake.nixosConfigurations.tatiman-zachary = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = with config.flake.nixosModules; [
            inputs.home-manager.nixosModules.home-manager

            configuration-zachary
            hardware-zachary
            home-zachary
            user-falon

        ];
    };
}
