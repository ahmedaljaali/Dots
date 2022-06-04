link:
	stow nvim  -t ~/.config
	stow alacritty -t ~/.config
	stow fish -t  ~/.config
	stow ranger -t ~/.config
	stow starship -t ~/.config
	stow i3 -t ~/.config
	stow xinitrc -t ~/
	stow wallpapers -t ~/
	stow nitrogen -t ~/.config/
	stow polybar -t ~/.config/
	stow rofi -t ~/.config/
	stow btop -t ~/.config/


unlink:
	unlink ~/.config/nvim
	unlink ~/.config/alacritty
	unlink ~/.config/fish
	unlink ~/.config/ranger
	unlink ~/.config/starship.toml
	unlink ~/.config/nitrogen
	unlink ~/.xinitrc
	unlink ~/wallpapers
	unlink ~/.config/i3
	unlink ~/.config/polybar
	unlink ~/.config/rofi
	unlink ~/.config/btop
