{config, ...}: let
  username = config.var.git.username;
  email = config.var.git.email;
in {
  programs.git = {
    enable = true;
    settings = {
      user.name = username;
      user.email = email;
    };
    signing = {
      format = "ssh";
      key = config.var.git.signing.key;
      signByDefault = true;
    };
  };
}
