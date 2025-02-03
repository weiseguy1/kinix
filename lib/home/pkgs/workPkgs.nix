{ pkgs, lib, config, ... }:

{
  options = {
    workPkgs.enable = lib.mkEnableOption "enables packages needed for work";
  };

  config = lib.mkIf config.workPkgs.enable {
    home.packages = with pkgs; [
      chromium
      onlyoffice-desktopeditors
      openldap
      remmina
      rocketchat-desktop
      zoom-us
    ];
  };
}
