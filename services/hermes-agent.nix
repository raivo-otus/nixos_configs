{...}: {
  services.hermes-agent = {
    enable = true;
    addToSystemPackages = true;
    container = {
      enable = true;
      backend = "docker";
      hostUsers = ["rph"];
    };
    settings.model = {
      base_url = "http://host.docker.internal:8081/v1";
      default = "local";
    };
  };
}
