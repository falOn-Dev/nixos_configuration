{ config, inputs, ... }:
{
    flake.nixosConfigurations.tatiman-prunes = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = with config.flake.nixosModules; [
            inputs.home-manager.nixosModules.home-manager

            configuration-prunes
            hardware-prunes
	    home-prunes
            user-falon

        ];
    };
}
