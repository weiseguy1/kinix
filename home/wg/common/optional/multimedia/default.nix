{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ffmpeg
    mpv
  ];
}
