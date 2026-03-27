{ ... }:
{
    flake.homeModules.home-falon-firefox-nvidia = { config, ... }: {
        programs.firefox.enable = true;

        xdg.desktopEntries.firefox-nvidia = {
            name = "Firefox (NVIDIA)";
            exec = "nvidia-offload firefox %u";
            terminal = false;
            categories = [ "Network" "WebBrowser" ];
        };
    };
}

