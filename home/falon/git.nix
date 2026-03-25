{ ... }:
{
    flake.homeModules.home-falon-git = { ... }: {
        programs.git = {
            enable = true;
            userName = "falOn-Dev";
            userEmail = "me@falon.dev";
        };
    };
}
