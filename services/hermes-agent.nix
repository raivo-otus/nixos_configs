{ config, ... }:

{
  sops.secrets."hermes-agent-env" = {
    sopsFile = ../secrets/grenth.yaml;
  };

  services.hermes-agent = {
    enable = true;

    settings.model = {
      base_url = "http://127.0.0.1:8081/v1";
      default = "local";
    };

    environmentFiles = [ config.sops.secrets."hermes-agent-env".path ];

    addToSystemPackages = true;

    container = {
      enable = true;
      backend = "docker";
      hostUsers = [ "rph" ];
    };
  };
}
