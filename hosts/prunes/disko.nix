{ ... }:

{
  flake.diskoConfigurations.tatiman-prunes = { ... }: {
    disko.devices = {
      disk = {
        system = {
          device = "/dev/disk/by-id/nvme-KBG40ZNS256G_NVMe_KIOXIA_256GB_X9RPC67PPTLL";
          type = "disk";

          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "512M";
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

        data = {
          device = "/dev/disk/by-id/ata-TOSHIBA_MQ04ABF100_X9HNTDKKT";
          type = "disk";

          content = {
            type = "gpt";
            partitions = {
              data = {
                size = "100%";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/data";
                };
              };
            };
          };
        };
      };
    };
  };
}
