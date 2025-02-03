{ lib, ... }:

{
  imports = [
    ./pkgs
  ];

  desktop.enable = lib.mkDefault false;
  work.enable = lib.mkDefault false;
}
