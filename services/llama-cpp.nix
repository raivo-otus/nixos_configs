{pkgs, ...}: {
  services.llama-cpp = {
    enable = true;
    package = pkgs.llama-cpp.override {rocmSupport = true;};
    host = "0.0.0.0";
    port = 8081;
    # Place your GGUF model at this path before starting the service
    model = "/srv/Hoard/Models/Qwen3.5-9B-UD-Q6_K_XL.gguf";
    extraFlags = [
      "--n-gpu-layers"
      "999" # offload all layers to the 7900 GRE
      "--ctx-size"
      "8192"
      "--parallel"
      "2"
      "--alias"
      "local"
    ];
    # If the 7900 GRE is not detected and inference falls back to CPU, uncomment:
    # environmentVariables.HSA_OVERRIDE_GFX_VERSION = "11.0.0";
  };

  systemd.tmpfiles.rules = [
    "d /srv/Hoard/Models 0755 root root -"
  ];

  networking.firewall.allowedTCPPorts = [8081];
}
