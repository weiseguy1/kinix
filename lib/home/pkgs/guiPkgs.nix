{ pkgs, lib, config, ... }:

{
  options = {
    guiPkgs.enable = lib.mkEnableOption "enables GUI packages";
  };

  config = lib.mkIf config.guiPkgs.enable {
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
