{ lib, pkgs, ... }:

{
  imports = [
    ./direnv.nix
    ./gamePkgs.nix
  ];

  environment.systemPackages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "NerdFontsSymbolsOnly" ]; })

    act
    ansible
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
    vagrant
    wget
    zip
  ];

  gamePkgs.enable = lib.mkDefault true;
}
