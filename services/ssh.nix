{ ... }:

{
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
    };
    extraConfig = ''
      ClientAliveInterval 60
      ClientAliveCountMax 3
    '';
  };
}
