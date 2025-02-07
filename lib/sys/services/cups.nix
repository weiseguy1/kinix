{ config, lib, ... }:

{
  options = {
    cupsService.enable = lib.mkEnableOption "enables CUPS Service";
  };


  config = lib.mkIf config.cupsService.enable {
    services.printing.enable = true;
  };
}

