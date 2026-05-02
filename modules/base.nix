{...}: {
  imports = [
    ./locale.nix
    ./shell.nix
    ./nix-settings.nix
    ./cli-tools.nix
    ./devshells.nix
    ../services/ssh.nix
    ../services/tailscale.nix
  ];
}
