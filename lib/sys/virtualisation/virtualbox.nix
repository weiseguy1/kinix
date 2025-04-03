{ pkgs, ... }:

{
  virtualisation.virtualbox.host = {
    enable = true;
    package = pkgs.virtualbox;
    enableExtensionPack = true;
  };

  users.groups.virtualbox.members = [ "wg" ];
}

