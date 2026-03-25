{ ... }:
{
    flake.homeModules.home-falon-git = { pkgs, ... }: {
        home.packages = with pkgs; [
            lazygit
        ];

        programs.git = {
            enable = true;
            userName = "falOn-Dev";
            userEmail = "me@falon.dev";
        };
    };
}
