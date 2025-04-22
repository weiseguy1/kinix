{ config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    completionInit = "autoload -U compinit && compinit";
    shellAliases = {
      cat = "bat -pp";
      l = "exa -l --git";
      ls = "exa";
      la = "exa -A";
      ll = "exa -lA --git";
      diff = "diff -y --suppress-common-lines";
    };
    initExtraBeforeCompInit =
    ''
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 
    '';
    initExtra = ''
      autoload -Uz vcs_info
      autoload -U colors && colors
      zstyle ':vcs_info:*' enable git 

      precmd_vcs_info() { vcs_info }
      precmd_functions+=( precmd_vcs_info )
      setopt prompt_subst

      # add a function to check for untracked files in the directory.
      # from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
      zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
      # 
      +vi-git-untracked(){
          if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
              git status --porcelain | grep '??' &> /dev/null ; then
              hook_com[staged]+='!' # signify new files with a bang
          fi
      }

      zstyle ':vcs_info:*' check-for-changes true
      zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"

      PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
      PROMPT+="\$vcs_info_msg_0_%{$reset_color%}%b "
    '';
    history = {
      size = 5000;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
