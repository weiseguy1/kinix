{ pkgs, ... }:
{
  users.users.wg = {
    shell = pkgs.zsh;
    isNormalUser = true;
    uid = 1000;
    initialPassword = "nixos123!";
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "input"
      "network"
      "networkmanager"
      "plugdev"
      "git"
    ];
  };
}
