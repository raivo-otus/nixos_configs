{ config, ... }:

{
  sops.secrets."open-webui-env" = {
    sopsFile = ../../secrets/grenth.yaml;
  };

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

  # Inject secret key via sops so it persists across restarts without hitting the nix store
  systemd.services.open-webui.serviceConfig.EnvironmentFile = config.sops.secrets."open-webui-env".path;

  networking.firewall.allowedTCPPorts = [ 8080 ];
}
