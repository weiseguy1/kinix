{ pkgs, lib, config, ... }:

{
  options = {
    work.enable = lib.mkEnableOption "enables work packages";
  };

  config = lib.mkIf config.work.enable {
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
