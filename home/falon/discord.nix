
{ ... }:
{
    flake.homeModules.home-falon-discord = { pkgs, ... }: {
        home.packages = with pkgs; [
            discord-ptb
        ];
    };
}
