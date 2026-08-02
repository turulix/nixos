{
  description = "My First NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dank-greeter = {
      url = "github:AvengeMedia/dank-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      args = {
        inherit
          inputs
          nixpkgs
          system
          pkgs
          ;
        pkgs-stable = nixpkgs-stable.legacyPackages.${system};
      };
      merge = nixpkgs.lib.foldl nixpkgs.lib.recursiveUpdate { };
    in
    merge [
      {
        formatter.${system} = pkgs.nixfmt-tree;
        nixosConfigurations = {
          IdeaPad-S340 = import ./hosts/IdeaPad-S340/flake.nix args;
        };
      }
    ];
}
