{ lib, ... }:

{
  imports = [
    ./nvidia
  ];

  nvidiaDriver.enable = lib.mkDefault false;
  nvidiaDriver.useOpen = lib.mkDefault true;
}
