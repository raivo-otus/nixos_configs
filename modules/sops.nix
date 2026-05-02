{ ... }:

{
  # Derive the host's age decryption key from its SSH ed25519 host key.
  # The corresponding public key must be listed in .sops.yaml for this host.
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
}
