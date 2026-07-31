{pkgs, ...}: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  environment.systemPackages = with pkgs; [
    htop
    wget
    git
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];

  environment.variables = {
    SSH_AUTH_SOCK = "/home/tim/.bitwarden-ssh-agent.sock";
  };
}
