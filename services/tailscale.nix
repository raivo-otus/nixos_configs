{ config, ... }:

{
  services = {
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
  };

  networking.firewall.trustedInterfaces = [ "tailscale0" ];
  networking.firewall.allowedUDPPorts = [ config.services.tailscale.port ];
}

