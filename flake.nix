{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      legacyPackages = nixpkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" ] (system:
        import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );
    in
  {
    nixosConfigurations = { 
      framework13 = lib.nixosSystem {
        inherit system;
        modules = [ ./etc/hostname.d/framework13 ];
      };
      desktop = lib.nixosSystem {
        inherit system;
        modules = [ ./etc/hostname.d/desktop ];
      };
    };
    homeConfigurations = {
      wg = home-manager.lib.homeManagerConfiguration {
        pkgs = legacyPackages.x86_64-linux;
        modules = [ 
          ./home/wg.nix
          inputs.nixvim.homeManagerModules.nixvim 
        ];
      };
      kweise = home-manager.lib.homeManagerConfiguration {
        pkgs = legacyPackages.x86_64-linux;
        modules = [ 
          ./home/kweise.nix
          inputs.nixvim.homeManagerModules.nixvim 
        ];
      };
    };
  };
}
