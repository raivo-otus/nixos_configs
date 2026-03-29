{ config, pkgs, ... }:

{
  # 1. Enable Caddy
  services.caddy = {
    enable = true;
    
    # 2. Define your "Virtual Hosts"
    virtualHosts = {
      
      # Sonarr
      "http://sonarr.lyssa" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:8989
        '';
      };

      # Radarr
      "http://radarr.lyssa" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:7878
        '';
      };

      # SABnzbd
      "http://sabnzbd.lyssa" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:8080
        '';
      };

      # Jellyfin
      "http://jellyfin.lyssa" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:8096
        '';
      };

      # AdGuard Home
      "http://adguard.lyssa" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:3000
        '';
      };

    };
  };

  # 3. Open Web Ports
  # Caddy needs these to receive the traffic before forwarding it
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
