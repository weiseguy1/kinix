{ pkgs, ... }:

{
  home.packages = with pkgs; [
    act
    ansible
    bun
    dbeaver-bin
    direnv
    gh
    gnumake
    nmap
    man-pages
    man-pages-posix
    openldap
    vagrant
    vscode
  ];
}
