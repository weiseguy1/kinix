{ pkgs, lib, config, ... }:

{
  options = {
    base.enable = lib.mkEnableOption "enables base packages";
  };

  config = lib.mkIf config.base.enable {
    environment.systemPackages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

      act
      bc
      bun
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
      wget
      zip
    ];
  };
}
