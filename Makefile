link:
	stow nvim  -t ~/.config
	stow alacritty -t ~/.config
	stow fish -t  ~/.config
	stow ranger -t ~/.config
	stow starship -t ~/.config
	stow xmonad -t ~/
	stow xmobar -t ~/
	stow xinitrc -t ~/
	stow wallpapers -t ~/
	ln -s ~/Dots/git/xmonad/stack.yaml ~/Dots/xmonad/.xmonad
	ln -s ~/Dots/git/xmonad/stack.yaml ~/Dots/xmobar/.xmobar


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
	unlink ~/Dots/xmobar/.xmobar/stack.yaml
	unlink ~/Dots/xmonad/.xmonad/stack.yaml
