{
  description = "My First NixOS Flake";

  inputs = {
    # This is the standard NixOS channel. 
    # For bleeding-edge packages, use "github:nixos/nixpkgs/nixos-unstable"
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }@inputs: {
    nixosConfigurations = {
      # Replace 'nixos' with your actual hostname
      IdeaPad-S340 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/IdeaPad-S340/configuration.nix
          home-manager.nixosModules.home-manager
          
          # --- NIXOS HARDWARE MODULES ---
          nixos-hardware.nixosModules.common-pc-laptop
          nixos-hardware.nixosModules.common-cpu-amd
          nixos-hardware.nixosModules.common-gpu-amd
        ];
      };
    };
  };
}
