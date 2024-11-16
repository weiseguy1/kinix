{ pkgs }:

pkgs.writeShellScriptBin "kinix" ''
    if [[ `git -C $HOME/.config/nixos status --porcelain` ]]; then
        echo "WARNING: repo has unstaged files!"
    fi
    #sudo nixos-rebuild switch --flake ~/.config/nixos#default
''
