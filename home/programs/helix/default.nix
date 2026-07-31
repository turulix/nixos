{
  config,
  pkgs,
  lib,
  osConfig,
  ...
}:
let
in
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nixd
    ];

    languages = {
      language-server.nixd = {
        command = "nixd";
        args = [ "--semantic-tokens=true" ];

        config.nixd =
          let
            myFlake = ''(builtins.getFlake "/etc/nixos")'';
            nixosOpts = "${myFlake}.nixosConfigurations.${osConfig.networking.hostName}.options";
          in
          {
            nixpkgs.expr = "import ${myFlake}.inputs.nixpkgs { }";
            formatting.command = [ "${lib.getExe pkgs.nixfmt}" ];
            options = {
              nixos.expr = nixosOpts;
              home-manager.expr = "${nixosOpts}.home-manager.users.type.getSubOptions []";
            };
          };
      };
      language = [
        {
          name = "nix";
          auto-format = true;
        }
      ];
    };
  };
}
