{config, pkgs, ...}:

{
  # Enable Dwm
  services.xserver.windowManager.dwm.enable = true;
  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    src = ./dwm;
  };

  environment.systemPackages = with pkgs; [
    (slstatus.overrideAttrs (_:{ src = ./dwm/slstatus;}))
  ];
}
