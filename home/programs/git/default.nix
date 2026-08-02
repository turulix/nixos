{
  lib,
  osConfig,
  ...
}:
let
  username = osConfig.var.git.username;
  email = osConfig.var.git.email;
in
{
  programs.git = {
    enable = osConfig.var.git.enable;
    settings = {
      user.name = username;
      user.email = email;
    };
    signing = lib.mkIf osConfig.var.git.enable {
      format = "ssh";
      key = osConfig.var.git.signing.key;
      signByDefault = true;
    };
  };
}
