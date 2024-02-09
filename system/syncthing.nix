{config, pkgs, ...}:
{
services = {
    syncthing = {
        enable = false;
        user = "rileyl";
        dataDir = "/home/rileyl/Documents";    # Default folder for new synced folders
        configDir = "/home/rileyl/Documents/.config/syncthing";   # Folder for Syncthing's settings and keys
        settings.gui = {
          user = "rileyl";
          password = "Lucas4321";
        };
    };
};
}
