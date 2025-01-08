{ pkgs, ... }:

{
  imports = [
    ./options.nix
    ./lsp.nix
    ./plugins/autopairs.nix
    ./plugins/cmp.nix
    ./plugins/treesitter.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true;
    viAlias = true;
    vimAlias = true;

    clipboard.register = "unnamedplus";
    colorschemes.catppuccin.enable = true;
    plugins = { 
      lualine.enable = true;
    };
  };
}
