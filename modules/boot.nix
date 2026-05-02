{...}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0; # boots immediately; press Space to open the menu

  boot.plymouth.enable = true;
  boot.plymouth.theme = "bgrt"; # OEM logo + spinner; change to "spinner" if no OEM logo

  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.kernelParams = [
    "quiet"
    "splash"
    "rd.udev.log_level=3"
    "udev.log_level=3"
  ];
}
