{ ... }:
{
    flake.homeModules.home-falon-pywal = { pkgs, ... }: {
        home.packages = with pkgs; [
            pywal16
            colorz
            imagemagick
        ];
    };
}
