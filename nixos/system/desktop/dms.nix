{ config, lib, ... }:
let
  cfg = config.var.desktop.dms;
in
{
  config = lib.mkIf (cfg.enable) {
    var.internal.compositors.${cfg.compositor}.enable = true;
    var.internal.greeters.dms-greeter.enable = true;
  };
}
