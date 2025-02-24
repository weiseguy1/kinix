{ lib, pkgs, ... }:

{
  imports = [
    ./gamePkgs.nix
  ];

  environment.systemPackages = with pkgs; [
    caligula # for burning isos. Will move to separate module soon

    act
    bc
    bun
    devenv
    dig
    dust
    duf
    fastfetch
    fd
    ffmpeg-full
    file
    font-awesome
    gcc
    git
    gnumake
    grex
    htop
    jaq
    jq
    just
    killall
    nerd-fonts.jetbrains-mono
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
    smartmontools
    tree
    unrar
    unzip
    wget
    zip
  ];

  gamePkgs.enable = lib.mkDefault true;
}
