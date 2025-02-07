{ config, lib, pkgs, ... }:

{
  options = {
    udevService.enable = lib.mkEnableOption "enables udev Service";
  };


  config = lib.mkIf config.udevService.enable {
    services.udev = {
      packages = with pkgs; [
        android-udev-rules 
      ];
    };
  };
}

