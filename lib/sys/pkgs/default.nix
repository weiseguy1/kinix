{ lib, ... }:

{
  imports = [
    ./base.nix
  ];

  base.enable = lib.mkDefault true;
}
