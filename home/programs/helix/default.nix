{
  pkgs,
  osConfig,
  ...
}:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nil
      nixd
      nixfmt
    ];

    languages = {
      language-server.nixd = {
        command = "${pkgs.nixd}/bin/nixd";
        config =
          let
            myFlake = ''(builtins.getFlake "/etc/nixos")'';
            nixosOpts = "${myFlake}.nixosConfigurations.${osConfig.networking.hostName}.options";
          in
          {
            nixpkgs.expr = "import ${myFlake}.inputs.nixpkgs { }";
            options = {
              nixos.expr = nixosOpts;
              home-manager.expr = "${nixosOpts}.home-manager.users.type.getSubOptions []";
            };
          };
      };

      language = [
        {
          name = "nix";
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
          auto-format = true;
          language-servers = [
            # "nil"
            "nixd"
          ];
        }
      ];
    };

    settings = {
      editor = {
        auto-format = true;
      };
    };
  };
}
