link:
	stow nvim-conf  -t ~/.config
	stow alacritty-conf -t ~/.config
	stow fish-conf -t  ~/.config
	stow ranger-conf -t ~/.config
	stow starship-conf -t ~/.config
	stow xmonad-conf -t ~/
	stow xmobar-conf -t ~/
	stow xinitrc-conf -t ~/
	stow wallpapers -t ~/


unlink:
	unlink ~/.config/nvim
	unlink ~/.config/alacritty
	unlink ~/.config/fish
	unlink ~/.config/ranger
	unlink ~/.config/starship.toml
	unlink ~/.xmonad
	unlink ~/.xinitrc
	unlink ~/.xmobar
	unlink ~/wallpapers
