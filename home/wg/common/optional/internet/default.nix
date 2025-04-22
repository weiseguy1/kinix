{ pkgs, ... }:

{
  imports = [
    ./brave.nix
    ./chromium.nix
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    remmina
    rocketchat-desktop
    thunderbird
  ];
}
