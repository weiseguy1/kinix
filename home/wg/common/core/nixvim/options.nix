{ ... }:

{
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    guifont = "monospace:h17";
    scrolloff = 8;
    sidescrolloff = 8;
    wrap = false;
  };
}
