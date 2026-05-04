{...}: {
  services.hermes-agent = {
    enable = true;
    addToSystemPackages = true;
    settings.model = {
      # Point to the local llama.cpp OpenAI-compatible API
      base_url = "http://localhost:8081/v1";
      # Matches the --alias flag set in llama-cpp.nix
      default = "local";
    };
  };
}
