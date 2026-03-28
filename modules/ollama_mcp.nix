{
  config,
  pkgs,
  ...
}: {
  # Enable Ollama
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    # Expose the API to your local network
    host = "0.0.0.0";
    port = 11434;
  };

  # Open the port in the firewall so other devices can connect
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [11434];
  };

  environment.shellAliases = {
    ai-up = "sudo systemctl start ollama";
    ai-down = "sudo systemctl stop ollama";
  };
}
