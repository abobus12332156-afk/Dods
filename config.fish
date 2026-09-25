source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
	clear && fastfetch
end

alias cl="clear && fastfetch"
set -gx PATH ~/.npm-global/bin $PATH

alias fcrr="cargo fmt && cargo run --release"

alias ff="clear && fastfetch --logo NixOS"

alias fg="clear && fastfetch --logo Gentoo"

alias rain="treminal-rain -t --rain-color cyan --lightning-color yellow"

alias clock="tty-clock -sScC 5"

# opencode
fish_add_path /home/nikita/.opencode/bin
