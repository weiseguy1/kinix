{ lib, ... }:

{
  imports = [
    ./cups.nix
    ./openssh.nix
    ./openvpn.nix
    ./udev.nix
  ];

  cupsService.enable = lib.mkDefault false;
  vpnService.enable = lib.mkDefault false;
  udevService.enable = lib.mkDefault false;
}
