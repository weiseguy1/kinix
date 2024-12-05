{ pkgs, ... }:

{
  programs.dconf.enable = true;
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    # https://github.com/NixOS/nixpkgs/issues/267579
    (virt-manager.overrideAttrs (old: {
      nativeBuildInputs = old.nativeBuildInputs ++ [wrapGAppsHook];
      buildInputs = lib.lists.subtractLists [wrapGAppsHook] old.buildInputs ++ [
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-good
      ];
    }))

    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
  ];

  virtualisation = {
    libvirtd = { 
      enable = true;
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
}
