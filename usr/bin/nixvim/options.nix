{ ... }:

{
  programs.nixvim.opts = {
    number = true;
		relativenumber = true;
		shiftwidth = 2;
		tabstop = 2;
		guifont = "monospace:h17";
		scrolloff = 8;
		sidescrolloff = 8;
	};
}
