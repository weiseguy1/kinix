{ pkgs, ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true; 
    servers = {
      nil_ls = { 
        enable = true;
        package = pkgs.nil;
      };
      cssls = { 
        enable = true;
        package = pkgs.vscode-langservers-extracted;
      };
      html = { 
        enable = true;
        package = pkgs.vscode-langservers-extracted;
      };
      bashls = { 
        enable = true;
      };
    };
  };
}
