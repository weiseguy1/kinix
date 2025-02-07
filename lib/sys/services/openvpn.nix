{ config, lib, ... }:

{
  options = {
    vpnService.enable = lib.mkEnableOption "enables VPN Service";
  };


  config = lib.mkIf config.vpnService.enable {
    services.openvpn.servers = {
      work = {
        config = '' config /etc/openvpn/client/work.config '';
        autoStart = false;
        updateResolvConf = true;
      };
    };
  };
}
