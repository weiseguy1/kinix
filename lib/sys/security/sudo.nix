{
  security.sudo = {
    enable = true;
    keepTerminfo = true;
    extraConfig = ''
      Defaults env_reset,pwfeedback
    '';
  };

  environment.variables.SUDO_PROMPT = "[🔒] password for $( whoami ): ";
}
