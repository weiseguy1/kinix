{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
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
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
  {
    nixosConfigurations = { 
      fuji = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./hosts/nixos/fuji
          inputs.disko.nixosModules.default
        ];
      };
      aso = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/nixos/aso
          inputs.disko.nixosModules.default
        ];
      };
    };
    homeConfigurations = {
      wg = home-manager.lib.homeManagerConfiguration {
	      inherit pkgs;
        modules = [ 
          ./home/wg
          inputs.nixvim.homeManagerModules.nixvim 
        ];
      };
    };
  };
}
