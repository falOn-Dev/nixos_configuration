{ ... }:
{
    flake.nixosModules.nvidia-prunes = { pkgs, inputs, ... }: {
        hardware.graphics.enable = true;
        services.xserver.videoDrivers = [ "nvidia" "modesetting" ];

        hardware.nvidia.open = true;
        hardware.nvidia.modesetting.enable = true;

        hardware.nvidia.prime = {
            offload.enable = true;
            offload.enableOffloadCmd = true;

            intelBusId = "PCI:0@0:2:0";
            nvidiaBusId = "PCI:1@0:0:0";
        }
    };
}

