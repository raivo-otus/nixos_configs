{ pkgs, config, ... }:

{

  boot.kernelParams = [ "vsyscall=emulate" ];

  virtualisation.oci-containers = {
    containers.teamspeak6 = {
      image = "teamspeaksystems/teamspeak6-server:latest";
      ports = [
        "9987:9987/udp"  # Voice service
        "30033:30033/tcp"  # File transfer
      ];
      volumes = [
        "/var/lib/teamspeak6:/var/tsserver/"
      ];
      environment = {
        TSSERVER_LICENSE_ACCEPTED = "accept";
      };
      extraOptions = [
        "--security-opt=seccomp=unconfined"
        "--cap-add=SYS_NICE"
      ];
    };
  };

  systemd.tmpfiles.rules = [
    "d /var/lib/teamspeak6 0755 9987 9987 -"
  ];

  networking.firewall = {
    allowedTCPPorts = [
      30033
    ];
    allowedUDPPorts = [
      9987
    ];
  };

}
