{ config, lib, ... }:
lib.mkIf (config.var.internal.greeters.sddm.enable) {
  services.displayManager.sddm.enable = true;
}
