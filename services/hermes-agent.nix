{ ... }:

{
  services.hermes-agent = {
    enable = true;

    settings.model = {
      base_url = "http://127.0.0.1:8081/v1";
      default = "local";
    };

    # API keys and secrets — create this file on the machine, it must not go in the Nix store.
    # Minimum contents: OPENAI_API_KEY=local (llama.cpp requires a non-empty key)
    environmentFiles = [ "/etc/hermes-agent.env" ];

    addToSystemPackages = true;
  };
}
