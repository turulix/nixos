{
  config,
  pkgs,
  ...
}: {
  home-manager.users.root = import ./home.nix;
}
