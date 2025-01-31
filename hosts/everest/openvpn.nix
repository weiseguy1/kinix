{ config, pkgs, ... }:

{
  services.openvpn.servers = {
    work = {
      config = '' config /etc/openvpn/client/work.config '';
      autoStart = false;
      updateResolvConf = true;
    };
  };
}
