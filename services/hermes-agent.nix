{ ... }:

{
  services.hermes-agent = {
    enable = true;

    settings.model = {
      base_url = "http://127.0.0.1:8081/v1";
      default = "local";
    };

    addToSystemPackages = true;

    container = {
      enable = true;
      backend = "docker";
      hostUsers = [ "rph" ];
    };
  };
}
