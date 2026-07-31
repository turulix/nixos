{config, ...}: {
  imports = [
    ../../home/programs/helix
    ../../home/programs/git
    ../../home/programs/bitwarden-desktop
    ../../home/programs/discord
    ../../home/programs/steam

    ../../home/programs/shell/zsh.nix

    ./variables.nix
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    stateVersion = "26.05";
  };

  programs = {
    home-manager.enable = true;
  };
}
