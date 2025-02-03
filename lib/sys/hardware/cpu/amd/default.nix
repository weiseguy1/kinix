{ config, lib, ... }:

{
  options = {
    amdFirmware.enable = lib.mkEnableOption "enables AMD Microcode";
  };

  config = lib.mkIf config.amdFirmware.enable {
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
