{
  config,
  pkgs,
  ...
}: {
  services.adguardhome = {
    enable = true;

    # 1. Open the Firewall automatically
    # This opens Port 53 (DNS) and Port 3000 (Initial Web Setup)
    openFirewall = true;

    # 2. Configure the Listen Address
    # We force it to listen on all interfaces so Caddy can reach it at 127.0.0.1
    # and your network can reach it at 192.168.1.X
    settings = {
      http = {
        address = "0.0.0.0:3000";
      };
      dns = {
        bind_hosts = ["0.0.0.0"];
      };
    };
  };

  # 3. Workaround for Port 53 Conflicts
  # NixOS's default DNS resolver (systemd-resolved) often fights for Port 53.
  # We disable the stub listener so AdGuard can have the port to itself.
  services.resolved = {
    enable = true;
    extraConfig = "DNSStubListener=no";
  };
}
