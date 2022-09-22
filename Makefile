link:
	stow nvim  -t ~/.config
	stow alacritty -t ~/.config
	stow fish -t  ~/.config
	stow ranger -t ~/.config
	stow starship -t ~/.config
	stow xinitrc -t ~/
	stow wallpapers -t ~/
	stow nitrogen -t ~/.config/
	stow rofi -t ~/.config/
	stow btop -t ~/.config/
	stow betterlockscreenrc -t ~/.config/
	stow dunst -t ~/.config/
	stow picom -t ~/.config/
	stow redshift -t ~/.config/
	stow neofetch -t ~/.config/
	stow zathura -t ~/.config/
	stow fontconfig -t ~/.config/

unlink:
	unlink ~/.config/nvim
	unlink ~/.config/alacritty
	unlink ~/.config/fish
	unlink ~/.config/ranger
	unlink ~/.config/starship.toml
	unlink ~/.config/nitrogen
	unlink ~/.xinitrc
	unlink ~/wallpapers
	unlink ~/.config/rofi
	unlink ~/.config/btop
	unlink ~/.config/betterlockscreenrc
	unlink ~/.config/dunst
	unlink ~/.config/picom
	unlink ~/.config/redshift
	unlink ~/.config/neofetch
	unlink ~/.config/zathura
	unlink ~/.config/fontconfig
