{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/25.11";
        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree";
        home-manager.url = "github:nix-community/home-manager/release-25.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        disko.url = "github:nix-community/disko";
        disko.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs:
        inputs.flake-parts.lib.mkFlake { inherit inputs; } {
            systems = [ "x86_64-linux" ];

            imports = [
                inputs.home-manager.flakeModules.home-manager
                inputs.disko.flakeModules.default;
                (inputs.import-tree ./hosts)
                (inputs.import-tree ./features)
                (inputs.import-tree ./home)
                (inputs.import-tree ./users)
            ];
        };
}
