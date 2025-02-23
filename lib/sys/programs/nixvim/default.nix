{ pkgs, ... }:

{
  imports = [ ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true;
    viAlias = true;
    vimAlias = true;

    clipboard.register = "unnamedplus";
    plugins = {
      lualine.enable = true;
    };
  };
}
