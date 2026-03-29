{ pkgs, config, ... }:

{
  services = {
    tailscale = {
      enable = true;
      package = pkgs.tailscale;
      useRoutingFeatures = "client";
    };
  };

  networking.firewall.trustedInterfaces = [ "tailsacle0" ];
  networking.firewall.allowedUDPPorts = [ config.services.tailscale.port ];
}

