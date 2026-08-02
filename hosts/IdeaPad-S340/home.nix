{
  inputs,
  osConfig,
  pkgs,
  ...
}:
{
  imports = [
    ../../home/programs/helix
    ../../home/programs/git
    ../../home/programs/bitwarden-desktop
    ../../home/programs/discord

    ../../home/programs/shell/zsh.nix

    # System Components
    ../../home/system
  ];

  home = {
    inherit (osConfig.var) username;
    homeDirectory = "/home/" + osConfig.var.username;

    stateVersion = "26.05";
  };

  programs = {
    home-manager.enable = true;
  };
}
