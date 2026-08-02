{
  inputs,
  pkgs,
  osConfig,
  lib,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = lib.mkIf (osConfig.var.internal.compositors.niri.enable) {
    enable = true;
    package = pkgs.niri;
  };
}
