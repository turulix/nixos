{ lib, config, ... }:
lib.mkMerge [
  (lib.mkIf (config.var.internal.greeters.dms-greeter.enable) {
    programs.dms-greeter = {
      enable = true;
    };

    services.displayManager.dms-greeter = {
      enable = true;
    };
  })

  #Setup Niri Compositor for DMS-Greeter
  (lib.mkIf (config.var.internal.compositors.niri.enable) {
    programs.niri.enable = true;
    programs.dms-greeter.compositor.name = "niri";
    services.displayManager.dms-greeter.compositor.name = "niri";
    systemd.user.services.niri.enableDefaultPath = false;
  })

  # Setup Hyprland compositor for DMS-Greeter
  (lib.mkIf (config.var.internal.compositors.hyprland.enable) {
    programs.hyprland.enable = true;
    programs.dms-greeter.compositor.name = "hyprland";
    services.displayManager.dms-greeter.compositor.name = "hyprland";
  })

]
