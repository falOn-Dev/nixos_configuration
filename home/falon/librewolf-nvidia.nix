{ ... }:
{
    flake.homeModules.home-falon-librewolf-nvidia = { config, ... }: {
        programs.librewolf.enable = true;

        xdg.desktopEntries.librewolf-nvidia = {
            name = "LibreWolf (NVIDIA)";
            exec = "nvidia-offload librewolf %u";
            terminal = false;
            categories = [ "Network" "WebBrowser" ];
        };
    };
}

