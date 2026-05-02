{...}: {
  imports = [
    ./locale.nix
    ./shell.nix
    ./nix-settings.nix
    ./cli-tools.nix
    ./devshells.nix
    ./sops.nix
    ../services/ssh.nix
    ../services/tailscale.nix
  ];
}
