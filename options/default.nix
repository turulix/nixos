{
  lib,
  ...
}:
let
  compositorsList = [
    "hyprland"
    "niri"
  ];
in
{
  options.var = {
    hostname = lib.mkOption { type = lib.types.str; };
    username = lib.mkOption { type = lib.types.str; };

    git = {
      enable = lib.mkEnableOption "Enable Git Setup";

      username = lib.mkOption { type = lib.types.str; };
      email = lib.mkOption { type = lib.types.str; };
      signing = {
        enable = lib.mkEnableOption "Enable Signing";
        key = lib.mkOption { type = lib.types.str; };
      };
    };

    autoUpgrade = lib.mkOption { type = lib.types.bool; };
    autoGarbageCollector = lib.mkOption { type = lib.types.bool; };

    desktop = {
      dms = {
        enable = lib.mkEnableOption "Enable DMS";

        compositor = lib.mkOption {
          type = lib.types.enum compositorsList;
          default = "niri";
        };
      };

      plasma = {
        enable = lib.mkEnableOption "Enable Plasma KDE";
      };
    };

    internal = {
      compositors = lib.genAttrs compositorsList (name: {
        enable = lib.mkEnableOption "the ${name} window manager";
      });

      greeters = {
        dms-greeter.enable = lib.mkEnableOption "Enable the DMS-Greeter";
        sddm.enable = lib.mkEnableOption "Enable the SDDM-Greeter";
      };
    };
  };
}
