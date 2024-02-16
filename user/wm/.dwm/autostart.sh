exec "nitrogen" --restore &
exec "slstatus" &
exec "sxhkd" &
exec "dunst" &
exec xss-lock -- slock &
exec "picom" -b &
exec "xmodmap" ~/.Xmodmap &
exec /nix/store/$(ls -la /nix/store | grep polkit-gnome-agent | grep '^d' | awk '{print $9}')/libexec/polkit-gnome-authentication-agent-1 & 

