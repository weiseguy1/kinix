{ pkgs, ... }:

{
  programs.brave = {
    enable = true;
    package = pkgs.brave;
    commandLineArgs = [
      "--no-default-browser-check"
      "--restore-last-session"
    ];
  };
}
