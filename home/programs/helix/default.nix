{
  config,
  pkgs,
  ...
}: let
in {
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
          # language-servers = ["nixd"];
        }
      ];
    };
  };
}
