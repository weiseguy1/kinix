{ lib, pkgs, ... }:

{
  imports = [
    ./direnv.nix
    ./gamePkgs.nix
  ];

  environment.systemPackages = with pkgs; [
    act
    bc
    devenv
    dig
    dust
    duf
    fastfetch
    fd
    file
    gcc
    git
    grex
    htop
    jaq
    jq
    just
    killall
    nmon
    openssl
    openvpn
    ouch
    p7zip
    pre-commit
    prettierd
    procs
    psmisc
    psutils
    ripgrep
    rsync
    scc
    tree
    unrar
    unzip
    wget
    zip
  ];
  
  services.fwupd.enable = true;
  gamePkgs.enable = lib.mkDefault true;
}
