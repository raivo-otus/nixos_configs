{
  config,
  pkgs,
  ...
}: {
  # Enable Ollama
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    host = "127.0.0.1";
    port = 11434;
  };

  environment.shellAliases = {
    ai-up = "sudo systemctl start ollama";
    ai-down = "sudo systemctl stop ollama";
  };
}
