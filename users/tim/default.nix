{ config, pkgs, ... }: 

{
  users.users."tim" = {
    isNormalUser = true;
    description = "tim";
    extraGroups = ["networkmanager" "wheel"];
    openssh = {
      authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFxBYt7vfrRyPODhaEYsI4ewFhcYImlgQRR36zvcHw2h"
      ];
    };
  };

  # Import Tim's Home Manager configuration
  home-manager.users.tim = import ./home.nix;
}
