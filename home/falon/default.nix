{ ... }:
{
    flake.homeModules.home-falon-base = { pkgs, ... }: {
        home.username = "falon";
        home.homeDirectory = "/home/falon";
        home.stateVersion = "25.11";

        home.packages = with pkgs; [
            bluetui
            networkmanagerapplet
        ];

    };
}
