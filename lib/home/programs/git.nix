{
  programs.git = {
    enable = true;
    userName = "WeiseGuy";
    userEmail = "info@weiseguy.net";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
