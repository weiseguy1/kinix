{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian
    onlyoffice-desktopeditors
  ];
}
