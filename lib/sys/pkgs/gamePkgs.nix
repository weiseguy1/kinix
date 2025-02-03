{ pkgs, lib, config, ... }:

{
  options = {
    gamePkgs.enable = lib.mkEnableOption "enables packages needed for Gaming";
  };

  config = lib.mkIf config.gamePkgs.enable {
    environment.systemPackages = with pkgs; [
      lutris
      wineWowPackages.stable
    ];

    programs.steam = {
      enable = true;
    };
  };
}
