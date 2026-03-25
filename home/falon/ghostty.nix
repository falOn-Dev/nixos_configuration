{ ... }:
{
    flake.homeModules.home-falon-ghostty = { config, ... }: {
        programs.ghostty = {
            enable = true;
            settings = {
                window-decoration = "server";
                background-opacity = 0.9;
                background-blur = true;
                theme = "${config.home.homeDirectory}/.cache/wal/colors-ghostty";
                font-family = "Hurmit Nerd Font Mono";
            };
        };
    };
}
