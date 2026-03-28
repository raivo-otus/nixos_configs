{
  config,
  pkgs,
  ...
}: {
  # Enable Ollama
  services.ollama = {
    enable = true;
    # Expose the API to your local network
    host = "0.0.0.0";
    port = 11434;

    acceleration = "rocm";
  };

  # Open the port in the firewall so other devices can connect
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [11434];
  };

  # (Optional but recommended) Install a UI like Open-WebUI to manage models
  services.open-webui = {
    enable = true;
    port = 8080;
    environment = {
      OLLAMA_API_BASE_URL = "http://127.0.0.1:11434/api";
    };
  };
}
