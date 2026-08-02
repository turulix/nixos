{ ... }: {
  imports = [
    ./greeter/dms-greeter.nix
    ./greeter/sddm.nix
    ./desktop/dms.nix
    ./desktop/plasma.nix
  ];
}
