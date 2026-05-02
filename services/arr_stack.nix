{ config, pkgs, ... }:

{
  # Define the Containers
  virtualisation.oci-containers.containers = {

    sonarr = {
      image = "lscr.io/linuxserver/sonarr:latest";
      autoStart = true;
      ports = [ "127.0.0.1:8989:8989" ];
      environment = {
        PUID = "1000";
        PGID = "1000";
        TZ = "Europe/Helsinki";
      };
      volumes = [
        "/home/rpth/config/sonarr:/config"
        "/srv/Glaurung/data:/data"
      ];
    };

    radarr = {
      image = "lscr.io/linuxserver/radarr:latest";
      autoStart = true;
      ports = [ "127.0.0.1:7878:7878" ];
      environment = {
        PUID = "1000";
        PGID = "1000";
        TZ = "Europe/Helsinki";
      };
      volumes = [
        "/home/rpth/config/radarr:/config"
        "/srv/Glaurung/data:/data"
      ];
    };

    sabnzbd = {
      image = "lscr.io/linuxserver/sabnzbd:latest";
      autoStart = true;
      ports = [ "127.0.0.1:8080:8080" ];
      environment = {
        PUID = "1000";
        PGID = "1000";
        TZ = "Europe/Helsinki";
      };
      volumes = [
        "/home/rpth/config/sabnzbd:/config"
        "/srv/Glaurung/data:/data"
      ];
    };

    jellyfin = {
      image = "lscr.io/linuxserver/jellyfin:latest";
      autoStart = true;
      ports = [ "127.0.0.1:8096:8096" ];
      environment = {
        PUID = "1000";
        PGID = "1000";
        TZ = "Europe/Helsinki";
      };
      volumes = [
        "/home/rpth/config/jellyfin:/config"
        "/srv/Glaurung/data:/data" # Must match the Sonarr/Radarr media path
      ];
      extraOptions = [
        "--device=/dev/dri:/dev/dri"
        "--group-add=303"
      ];
    };

  };
  
  # 3. Firewall
  # Services bind to 127.0.0.1 and are only reachable via Caddy — no direct TCP exposure.
  # UDP ports are for Jellyfin LAN auto-discovery and must remain network-accessible.
  networking.firewall.allowedUDPPorts = [ 1900 7359 ];

  # Ensure directories exist with correct permissions (User 1000)
  systemd.tmpfiles.rules = [
    "d /home/rpth/config/sonarr 0755 1000 1000 -"
    "d /home/rpth/config/radarr 0755 1000 1000 -"
    "d /home/rpth/config/jellyfin 0755 1000 1000 -"
    "d /home/rpth/config/sabnzbd 0755 1000 1000 -"
    "d /srv/Glaurung/data/ 0775 1000 1000 -"
    "d /srv/Glaurung/data/usenet/incomplete 0775 1000 1000 -"
    "d /srv/Glaurung/data/usenet/complete 0775 1000 1000 -"
    "d /srv/Glaurung/data/usenet/complete/movies 0775 1000 1000 -"
    "d /srv/Glaurung/data/usenet/complete/series 0775 1000 1000 -"
    "d /srv/Glaurung/data/media/movies 0775 1000 1000 -"
    "d /srv/Glaurung/data/media/tv 0775 1000 1000 -"
  ];

}
