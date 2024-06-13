if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x PATH $HOME/.cargo/bin $PATH
    set -x CARGO_HOME $HOME/.cargo
    set -x RUSTUP_HOME $HOME/.rustup
end

# turn off fish shell welcome
function fish_greeting
end

# Rust mirror
set -x RUSTUP_UPDATE_ROOT https://rsproxy.cn/rustup
set -x RUSTUP_DIST_SERVER https://rsproxy.cn 

# zoxide for fish
zoxide init fish | source

# set default editor
set -x EDITOR vim

# yazi
function ya
	set tmp (mktemp -t "yazi-cwd.XXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

