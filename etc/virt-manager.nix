{
  virtualisation.libvirtd = { 
    enable = true;
    qemu.ovmf.enable = true;
    qemu.runAsRoot = false;
    onBoot = "ignore";
    onShutdown = "shutdown";
  };
  programs.virt-manager.enable = true;
}
