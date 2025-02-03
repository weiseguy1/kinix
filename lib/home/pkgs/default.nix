{ lib, ... }:

{
  imports = [
    ./guiPkgs.nix
    ./workPkgs.nix
  ];

  guiPkgs.enable = lib.mkDefault false;
  workPkgs.enable = lib.mkDefault false;
}
