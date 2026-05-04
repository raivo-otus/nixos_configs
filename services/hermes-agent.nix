{...}: {
  services.hermes-agent = {
    enable = true;
    addToSystemPackages = true;
    container = {
      enable = true;
      backend = "docker";
      hostUsers = ["rph"];
      extraVolumes = [
        "/home/rph/.hermes:/home/hermes/.hermes:rw"
        "/home/rph/Projects/hermes_wiki:/home/hermes/hermes_wiki:rw"
      ];
      extraOptions = ["--device" "/dev/kfd" "--device" "/dev/dri"];
    };
    settings = {
      model = {
        # host.docker.internal doesn't exist on Linux; use Docker bridge gateway
        base_url = "http://172.17.0.1:8081/v1";
        default = "local";
      };
      toolsets = ["all"];
    };
  };
}
