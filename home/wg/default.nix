{ ... }:

{
  imports = [
    ./common/core
    ./common/optional
  ];

  home.username = "wg";
  home.homeDirectory = "/home/wg";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
