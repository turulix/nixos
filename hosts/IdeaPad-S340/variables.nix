{
  config,
  lib,
  ...
}: {
  config.var = {
    hostname = "IdeaPad-S340";
    username = "tim";

    git = {
      username = "Tim";
      email = "28957605+turulix@users.noreply.github.com";
      signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBK40krEtJ/FXbsVgY6YcFn4jpO0WXjCk2Q5vwJL2zsh";
      };
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  # Don't Modify This
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
