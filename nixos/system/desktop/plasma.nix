{ config, lib, ... }:
lib.mkIf (config.var.desktop.plasma.enable) {

  var.internal.greeters.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}
