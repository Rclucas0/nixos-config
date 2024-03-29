{ pkgs, config, ... }:

let
  palette = config.colorScheme.palette;
in {
  home.file.".config/rofi/config.rasi".text = ''
    @theme "/dev/null"

    * {
        bg: #${palette.base00};
        background-color: @bg;
    }

    configuration {
	    show-icons: true;
	    icon-theme: "Papirus";
	    location: 0;
	    font: "Ubuntu 12";
	    display-drun: "Launch:";
    }

    window {
	    width: 35%;
	    transparency: "real";
	    orientation: vertical;
	    border-color: #${palette.base0B};
        border-radius: 10px;
    }

    mainbox {
	    children: [inputbar, listview];
    }


    // ELEMENT
    // -----------------------------------

    element {
	    padding: 4 12;
	    text-color: #${palette.base05};
        border-radius: 5px;
    }

    element selected {
	    text-color: #${palette.base01};
	    background-color: #${palette.base0B};
    }

    element-text {
	    background-color: inherit;
	    text-color: inherit;
    }

    element-icon {
	    size: 16 px;
	    background-color: inherit;
	    padding: 0 6 0 0;
	    alignment: vertical;
    }

    listview {
	    columns: 2;
	    lines: 9;
	    padding: 8 0;
	    fixed-height: true;
	    fixed-columns: true;
	    fixed-lines: true;
	    border: 0 10 6 10;
    }

    // INPUT BAR
    //------------------------------------------------

    entry {
	    text-color: #${palette.base05};
	    padding: 10 10 0 0;
	    margin: 0 -2 0 0;
    }

    inputbar {
	    background-image: url("~/.config/rofi/rofi.jpg", width);
	    padding: 180 0 0;
	    margin: 0 0 0 0;
    }

    prompt {
	    text-color: #${palette.base0D};
	    padding: 10 6 0 10;
	    margin: 0 -2 0 0;
    }
  '';
}
