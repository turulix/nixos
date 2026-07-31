{
  config,
  pkgs,
  ...
}: {
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
            nixos.expr = "(builtins.getFlake \"/etc/nixos\").nixosConfigurations.\"IdeaPad-S340\".options";
            home-manager.expr = ''(builtins.getFlake ("/etc/nixos")).nixosConfigurations.IdeaPad-S340.options.home-manager.users.type.getSubOptions []'';
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

  programs.git = {
    enable = true;
    settings = {
      user.name = "Tim";
      user.email = "tigga01@online.de";
    };
    signing.format = "ssh";
    signing.key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBK40krEtJ/FXbsVgY6YcFn4jpO0WXjCk2Q5vwJL2zsh";
    signing.signByDefault = true;
  };
}
