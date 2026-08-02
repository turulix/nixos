{
  inputs,
  lib,
  osConfig,
  ...
}:
let
  dms = osConfig.var.desktop.dms;
  isNiri = dms.compositor == "niri";
  isHypr = dms.compositor == "hyprland";
in
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];

  config = lib.mkIf dms.enable {
    programs.dank-material-shell = {
      enable = dms.enable;

      # Configure DMS to use Niri
      niri = lib.mkIf isNiri {
        enableSpawn = true;

        includes = {
          enable = true;
          override = true;
          originalFileName = "hm";
        };
      };

      # Configure DMS to use Hyprland
      systemd = lib.mkIf isHypr {
        enable = true;
        restartIfChanged = true;
      };
    };

    xdg.configFile."niri-config-dms".enable = dms.enable && isNiri;

  };
}
