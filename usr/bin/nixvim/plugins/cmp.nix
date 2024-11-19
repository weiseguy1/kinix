{ ... }:

{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = false;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
    };
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
  };
}
