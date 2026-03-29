{ config, pkgs, ... }:

{
  # 1. Enable Docker
  virtualisation.docker.enable = true;
  # Ensure the OCI containers backend is set to docker
  virtualisation.oci-containers.backend = "docker";

  # 2. Define the Containers
  virtualisation.oci-containers.containers = {

    sonarr = {
      image = "lscr.io/linuxserver/sonarr:latest";
      autoStart = true;
      ports = [ "8989:8989" ];
      environment = {
        PUID = "1000";
        PGID = "1000";
        TZ = "Etc/UTC";
      };
      volumes = [
        "/home/rpth/config/sonarr:/config" # UPDATE THIS
        "/srv/Glaurung/data:/data"
      ];
    };

    radarr = {
      image = "lscr.io/linuxserver/radarr:latest";
      autoStart = true;
      ports = [ "7878:7878" ];
      environment = {
        PUID = "1000";
        PGID = "1000";
        TZ = "Etc/UTC";
      };
      volumes = [
        "/home/rpth/config/radarr:/config" # UPDATE THIS
        "/srv/Glaurung/data:/data"
      ];
    };

    sabnzb = {
      image = "lscr.io/linuxserver/sabnzbd:latest";
      autoStart = true;
      ports = [ "8080:8080" ];
      environment = {
        PUID = "1000";
        PGID = "1000";
        TZ = "Etc/UTC";
      };
      volumes = [
        "/home/rpth/config/sabnzb:/config" # UPDATE THIS
        "/srv/Glaurung/data:/data"
      ];
    };

    jellyfin = {
      image = "lscr.io/linuxserver/jellyfin:latest";
      autoStart = true;
      ports = [ "8096:8096" ];
      environment = {
        PUID = "1000";
        PGID = "1000";
        TZ = "Etc/UTC";
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
  
  # 3. Open Firewall Ports
  # Even with Docker, it's good practice to explicitly open these in the host firewall
  networking.firewall = {
    allowedTCPPorts = [ 
      8989 # Sonarr
      7878 # Radarr
      8080 # Sabnzb
      8096 # Jellyfin
    ];

    allowedUDPPorts = [
      1900
      7359
    ];
  };

  # Ensure directories exist with correct permissions (User 1000)
  systemd.tmpfiles.rules = [
    "d /home/rpth/config/sonarr 0755 1000 1000 -"
    "d /home/rpth/config/radarr 0755 1000 1000 -"
    "d /home/rpth/config/jellyfin 0755 1000 1000 -"
    "d /home/rpth/config/sabnzb 0755 1000 1000 -"
    "d /srv/Glaurung/data/ 0775 1000 1000 -"
    "d /srv/Glaurung/data/usenet/incomplete 0775 1000 1000 -"
    "d /srv/Glaurung/data/usenet/complete 0775 1000 1000 -"
    "d /srv/Glaurung/data/usenet/complete/movies 0775 1000 1000 -"
    "d /srv/Glaurung/data/usenet/complete/series 0775 1000 1000 -"
    "d /srv/Glaurung/data/media/movies 0775 1000 1000 -"
    "d /srv/Glaurung/data/media/tv 0775 1000 1000 -"
  ];

}
