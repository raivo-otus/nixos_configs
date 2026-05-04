{pkgs, ...}: {
  services.llama-cpp = {
    enable = true;
    package = pkgs.llama-cpp.override {rocmSupport = true;};
    host = "0.0.0.0";
    port = 8081;
    model = "/srv/Hoard/Models/Qwen3.5-9B-UD-Q6_K_XL.gguf";
    extraFlags = [
      "--n-gpu-layers"
      "999" # offload all layers to the 7900 GRE
      "--ctx-size"
      "131072"
      "--parallel"
      "1"
      "--alias"
      "local"
    ];
  };

  systemd.tmpfiles.rules = [
    "d /srv/Hoard/Models 0755 root root -"
  ];

  networking.firewall.allowedTCPPorts = [8081];
}
