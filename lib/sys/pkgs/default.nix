{ lib, ... }:

{
  imports = [
    ./base.nix
    ./gamePkgs.nix
  ];

  base.enable = lib.mkDefault true;
  gamePkgs.enable = lib.mkDefault true;
}
