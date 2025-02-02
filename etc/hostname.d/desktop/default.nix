# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ 
      (modulesPath + "/installer/scan/not-detected.nix")
      ../configuration.nix
      ../../virt-manager.nix
    ];

  networking.hostName = "desktop";

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "amdgpu" "vfio-pci" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "amd_iommu=on" "pcie_aspm=off" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.initrd.preDeviceCommands = ''
    DEVS="0000:0c:00.0 0000:0c:00.1"
    for DEV in $DEVS; do
      echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
    done
    modprobe -i vfio-pci
  '';

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/aa799288-5d10-4967-b794-c9d860a16f84";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-b02648c2-383b-4772-a360-5f9d5175854f".device = "/dev/disk/by-uuid/b02648c2-383b-4772-a360-5f9d5175854f";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2E83-3A0F";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };


  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
