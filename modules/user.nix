{
  config,
  pkgs,
  ...
}: {
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

  # ---------------------------------------------------
  # Home Manager Configuration
  # ---------------------------------------------------
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.tim = {pkgs, ...}: {
    home.stateVersion = "26.05";

    home.packages = with pkgs; [
      brave
      bitwarden-desktop
    ];

    programs.bash.enable = true;

    home.sessionVariables = {
      SSH_AUTH_SOCK = "$HOME/.bitwarden-ssh-agent.sock";
    };

    programs.ssh = {
      enable = true;
      matchBlocks."*" = {
        extraOptions = {
          IdentityAgent = "~/.bitwarden-ssh-agent.sock";
        };
      };
    };

    programs.git = {
      enable = true;
      settings = {
        user.name = "Tim";
        user.email = "tigga01@online.de";
      };
      signing.format = "ssh";
      signing.key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBbfqYtZVd/Pm4SVyxPthEmw4UqUbJjKgWkg0nd/QXOb";
      signing.signByDefault = true;
    };

    programs.discord = {
      enable = true;
    };
  };

  home-manager.users.root = {pkgs, ...}: {
    home.stateVersion = "26.05";

    programs.bash.enable = true;

    home.sessionVariables = {
      SSH_AUTH_SOCK = "/home/tim/.bitwarden-ssh-agent.sock";
    };

    programs.helix = {
      enable = true;
      defaultEditor = true;

      extraPackages = with pkgs; [
        nil
        nixd
        alejandra
      ];

      languages = {
        language-server.nixd = {
          command = "nixd";
          config = {
            nixpkgs.expr = "import <nixpkgs> {}";
            options = {
              nixos.expr = ''(builtins.getFlake "/etc/nixos").nixosConfigurations."IdeaPad-S340".options'';
              home-manager.expr = ''(builtins.getFlake "/etc/nixos").nixosConfigurations.IdeaPad-S340.options.home-manager.users.type.getSubOptions []'';
            };
          };
        };
        language = [
          {
            name = "nix";
            auto-format = true;
            formatter.command = "alejandra";
            language-servers = ["nixd"];
          }
        ];
      };
    };

    programs.ssh = {
      enable = true;
      matchBlocks."*" = {
        extraOptions = {
          IdentityAgent = "/home/tim/.bitwarden-ssh-agent.sock";
        };
      };
    };

    programs.git = {
      enable = true;
      settings = {
        user.name = "Tim";
        user.email = "tigga01@online.de";
      };
      signing.format = "ssh";
      signing.key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBbfqYtZVd/Pm4SVyxPthEmw4UqUbJjKgWkg0nd/QXOb";
      signing.signByDefault = true;
    };
  };
}
