{ config, lib, ... }:


let
  inherit (lib) mkIf mkDefault versionOlder;
  
  # Use the latest possible nvidia package
  nvStable = config.boot.kernelPackages.nvidiaPackages.stable.version;
  nvBeta = config.boot.kernelPackages.nvidiaPackages.beta.version;

  nvidiaPackage =
    if (versionOlder nvBeta nvStable)
    then config.boot.kernelPackages.nvidiaPackages.stable
    else config.boot.kernelPackages.nvidiaPackages.beta;
in
{

  options = {
    nvidiaDriver.enable = lib.mkEnableOption "enables Nvidia Drivers";

    nvidiaDriver.useOpen = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Use Nvidia Open Source Drivers instead of Proprietary";
    };
  };

  config = lib.mkIf config.nvidiaDriver.enable {
    boot = {
      kernelModules = [
        "nvidia"
        "nvidia_modeset"
        "nvidia_drm"
        "nvidia_uvm"
      ];

      blacklistedKernelModules = ["nouveau"];
    };

    environment.sessionVariables = {
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      NVD_BACKEND = "direct";
    };

    hardware.nvidia = {
      package = mkDefault nvidiaPackage;
      open = config.nvidiaDriver.useOpen;
      nvidiaSettings = mkDefault true;
      modesetting.enable = mkDefault true;
    };
  };
}
