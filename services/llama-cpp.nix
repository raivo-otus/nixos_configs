{ pkgs, ... }:

{
  services.llama-cpp = {
    enable = true;
    package = pkgs.llama-cpp.override { rocmSupport = true; };
    host = "0.0.0.0";
    port = 8081;
    # Place your GGUF model at this path before starting the service
    model = "/srv/Hoard/models/model.gguf";
    extraFlags = [
      "--n-gpu-layers" "999"  # offload all layers to the 7900 GRE
      "--ctx-size" "8192"
      "--parallel" "2"
      "--alias" "local"
    ];
  };

  systemd.tmpfiles.rules = [
    "d /srv/Hoard/models 0755 root root -"
  ];

  networking.firewall.allowedTCPPorts = [ 8081 ];
}
