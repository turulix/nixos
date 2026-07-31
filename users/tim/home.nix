{
  config,
  pkgs,
  ...
}: {
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    brave
    bitwarden-desktop
  ];

  programs.discord = {
    enable = true;
  };
}
