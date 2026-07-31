{...}: {
  home-manager.sharedModules = [(import ./home.nix)];
}
