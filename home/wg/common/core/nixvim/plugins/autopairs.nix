{ ... }:

{
  programs.nixvim.plugins.nvim-autopairs = {
    enable = true;
    settings = {
      check_ts = true;
      ts_config = {
        lua = [ "string" "source" ];
        javascript = [ "string" "template_string" ];
      };
      disable_filetype = [ "TelescopePrompt" "spectre_panel" ];
      fast_wrap = {
        map = "<M-e>";
        chars = [ "{" "[" "(" "\"" "'" ];
        pattern = "[=[[%'%\"%>%]%)%}%,%]]=]";
        end_key = "$";
        keys = "qwertyuiopzxcvbnmasdfghjkl";
        manual_position = true;
        highlight = "Search";
        highlight_grey = "Comment";
      };
    };
  };
}
