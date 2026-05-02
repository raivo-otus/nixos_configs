{
  config,
  pkgs,
  ...
}: {
  # Enable Ollama
  services.ollama = {
    package = pkgs.ollama-rocm;
    enable = true;
    host = "0.0.0.0";
    port = 11434;
  };

  networking.firewall.allowedTCPPorts = [11434];

  environment.shellAliases = {
    ai-up = "sudo systemctl start ollama";
    ai-down = "sudo systemctl stop ollama";
  };
}
