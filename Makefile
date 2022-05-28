link:
	stow nvim  -t ~/.config
	stow alacritty -t ~/.config
	stow fish -t  ~/.config
	stow ranger -t ~/.config
	stow starship -t ~/.config
	stow xmonad -t ~/
	stow xmobar -t ~/.config
	stow .xinitrc -t ~/
	unlink ~/.xmonad.bak


unlink:
	unlink ~/.config/nvim
	unlink ~/.config/alacritty
	unlink ~/.config/fish 
	unlink ~/.config/ranger
	unlink ~/.config/starship.toml
	unlink ~/.xmonad
	unlink ~/.xinitrc
	unlink ~/.config/xmobar