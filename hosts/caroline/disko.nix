{ ... }:

{
  flake.diskoConfigurations.tatiman-caroline = { ... }: {
    disko.devices = {
      disk = {
        system = {
          device = "/dev/disk/by-id/ata-FTM48N325H_AS20062600051";
          type = "disk";

          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                };
              };

              root = {
                size = "100%";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                };
              };
            };
          };
        };
      };
    };
  };
}
