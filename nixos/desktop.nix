{
  config,
  pkgs,
  lib,
  ...
}:
lib.mkMerge [
  {
    # X11 and KDE Plasma 6
    services.xserver.enable = true;

    services.xserver.xkb = {
      layout = "de";
      variant = "";
    };

    # Audio via Pipewire
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    services.printing.enable = true;

    environment.systemPackages = with pkgs; [
      xwayland-satellite
      alacritty
      kitty
    ];
  }

]
