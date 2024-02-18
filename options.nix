

let
  waybarStyle = "slickbar"; # simplebar, slickbar, or default
in {

  slickbar = if waybarStyle == "slickbar" then true else false;
  simplebar = if waybarStyle == "simplebar" then true else false;

  clock24h = false;
}
