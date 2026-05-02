{
  config,
  pkgs,
  ...
}: {
  services.adguardhome = {
    enable = true;

    # 1. Open the Firewall automatically
    # Opens Port 53 (DNS) to the network. Port 3000 is loopback-only, so it stays internal.
    openFirewall = true;

    # 2. Configure the Listen Address
    # Bind the web UI to loopback only — Caddy proxies adguard.lyssa to 127.0.0.1:3000.
    # DNS binds to all interfaces so the network can reach it.
    settings = {
      http = {
        address = "127.0.0.1:3000";
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
