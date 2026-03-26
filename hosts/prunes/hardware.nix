{ ... }:

{
	flake.nixosModules.hardware-prunes = {
		config,
		lib,
		modulesPath,
		...
	}: {
		imports =
			[ (modulesPath + "/installer/scan/not-detected.nix")
			];

		boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];
		boot.initrd.kernelModules = [ ];
		boot.kernelModules = [ "kvm-intel" ];
		boot.extraModulePackages = [ ];

		fileSystems."/" =
		{ device = "/dev/disk/by-uuid/ecc2224f-2b1e-4a32-8c67-8a5dc12ceafe";
			fsType = "ext4";
		};

		fileSystems."/boot" =
		{ device = "/dev/disk/by-uuid/327A-6CB1";
			fsType = "vfat";
			options = [ "fmask=0022" "dmask=0022" ];
		};

		fileSystems."/data" =
		{ device = "/dev/disk/by-uuid/0c3f6917-fab9-479a-be38-9657f3c1fffc";
			fsType = "ext4";
		};

		swapDevices = [ ];

		nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
		hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
	};
}
