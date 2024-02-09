{ pkgs, config, lib, inputs, ... }:
let
  theme = config.colorScheme.palette;
  hyprplugins = inputs.hyprland-plugins.packages.${pkgs.system};
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    plugins = [
      hyprplugins.hyprtrails
    ];
    settings = {
      decoration = {
        shadow_offset = "0.5";
       "col.shadow" = "rgba(00000099)";
     };
      "$mod" = "SUPER";

      bindm = [
      # mouse movements
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod ALT, mouse:272, resizewindow"
      ];
    };
  };
}
