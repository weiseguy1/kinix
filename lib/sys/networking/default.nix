{
  networking = {
    networkmanager = {
      enable = true;
    };
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
    stevenblack = {
      enable = true;
      block = [ "fakenews" "gambling" "porn" ];
    };
  };
}
