{ lib, ... }:

{
  imports = [
    ./amd
    ./intel
  ];

  amdFirmware.enable = false;
  intelFirmware.enable = false;
}
