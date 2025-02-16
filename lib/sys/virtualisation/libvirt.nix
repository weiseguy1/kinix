{ pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
      ovmf = {
        enable = true;
      };
    };
  };

  users.groups.libvirtd.members = [ "wg" ];

  programs.virt-manager.enable = true;
}

