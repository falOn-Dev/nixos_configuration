{ ... }:

{
    flake.diskoConfigurations.tatiman-prunes = { ... }: {
        disko.devices = {
            disk = {
                system = {
                    device = "/dev/nvme0n1";
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
                    device = "/dev/sda"; # your 1TB drive
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
