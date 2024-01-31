{config, pkgs, ...}:
{
  # Enable Bluetooth and Start on Boot
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
}
