{ osConfig, lib, ... }:
lib.mkIf (osConfig.var.internal.compositors.hyprland.enable) {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      window_rule = {
        match.class = ".*";
        float = true;
      };
    };

    extraConfig = ''
      require("dms.colors")
      require("dms.outputs")
      require("dms.layout")
      require("dms.cursor")
      require("dms.binds")
      require("dms.binds-user")
      require("dms.windowrules")
    '';
  };
}
