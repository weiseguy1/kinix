{ lib, pkgs, ... }:

{
  imports = [
    ./gamePkgs.nix
  ];

  environment.systemPackages = with pkgs; [
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
    nerd-fonts.symbols-only
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

  gamePkgs.enable = lib.mkDefault true;
}
