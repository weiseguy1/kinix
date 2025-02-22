{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
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
          ./hosts/fuji
          inputs.disko.nixosModules.default
          inputs.nixvim.nixosModules.nixvim
          home-manager.nixosModules.home-manager {
            home-manager = { 
              useGlobalPkgs = true;
              useUserPackages = true;
              users = {
                wg = import ./home/wg;
              };
            };
          }
        ];
      };
      aso = lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/aso
          inputs.disko.nixosModules.default
          inputs.nixvim.nixosModules.nixvim
          home-manager.nixosModules.home-manager {
            home-manager = { 
              useGlobalPkgs = true;
              useUserPackages = true;
              users = {
                wg = import ./home/wg;
              };
            };
          }
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
