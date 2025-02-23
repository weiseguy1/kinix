{ lib, ... }:

{
  imports = [
    ./cpu
    ./gpu
    ./ssd
  ];

  hardware = { 
    graphics.enable = true;
    enableRedistributableFirmware = lib.mkDefault true;
  };
}
