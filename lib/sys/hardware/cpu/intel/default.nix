{ config, lib, ... }:

{
  options = {
    intelFirmware.enable = lib.mkEnableOption "enables Intel Microcode";
  };

  config = lib.mkIf config.intelFirmware.enable {
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
