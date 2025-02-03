{ pkgs, lib, config, ... }:

{
  options = {
    desktop.enable = lib.mkEnableOption "enables desktop packages";
  };

  config = lib.mkIf config.desktop.enable {
    home.packages = with pkgs; [
      brave
      freetube
      mpv
      obsidian
      thunderbird
      vscode
    ];
  };
}
