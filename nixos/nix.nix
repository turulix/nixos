{ config, inputs, ... }:
let
  autoGarbageCollector = config.var.autoGarbageCollector;
in
{
  security.sudo.extraConfig = ''
    Defaults timestamp_type=tty,timestamp_timeout=-1
  '';

  security.sudo.extraRules = [
    {
      users = [ config.var.username ];
      commands = [
        {
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
  };

  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    channel.enable = false;

    settings = {
      download-buffer-size = 262144000;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    gc = {
      automatic = autoGarbageCollector;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
