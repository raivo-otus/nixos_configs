{ ... }:

{
  services.open-webui = {
    enable = true;
    host = "0.0.0.0";
    port = 8080;
    environment = {
      ENABLE_OLLAMA_API = "false";
      OPENAI_API_BASE_URLS = "http://127.0.0.1:8081/v1";
      OPENAI_API_KEYS = "sk-none";
    };
  };

  networking.firewall.allowedTCPPorts = [ 8080 ];
}
