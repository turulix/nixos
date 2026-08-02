{
  inputs,
  nixpkgs,
  ...
}:
nixpkgs.lib.nixosSystem {
  modules = [
    {
      nixpkgs.overlays = [
      ];
      _module.args = { inherit inputs; };
    }

    # Home Manager
    inputs.home-manager.nixosModules.home-manager

    # Dank Greeter
    inputs.dank-greeter.nixosModules.default

    # Hardware Configurations
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate

    ./configuration.nix
  ];
}
