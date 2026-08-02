{ ... }:
{
  config.var = {
    hostname = "IdeaPad-S340";
    username = "tim";

    git = {
      enable = true;

      username = "Tim";
      email = "28957605+turulix@users.noreply.github.com";
      signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBK40krEtJ/FXbsVgY6YcFn4jpO0WXjCk2Q5vwJL2zsh";
      };
    };

    desktop = {
      dms = {
        enable = false;
        compositor = "niri";
      };
      plasma = {
        enable = true;
      };
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };
}
