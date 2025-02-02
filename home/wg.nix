{ pkgs, ... }:

{
  imports = [
    ./base
  ];

  home = {
    username = "wg";
    homeDirectory = "/home/wg";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      EDITOR = "nvim";
    };
    shellAliases = {
      shell = "nix-shell --command zsh -p $@";
    };

    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.05";
    packages = with pkgs; [
      obsidian
      tree
      brave
      mpv
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
