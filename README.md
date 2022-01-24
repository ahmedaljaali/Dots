# My neovim configuration

## Add copy and past to neovim
`sudo pacman -S xsel`

## Add python support to neovim
`sudo pip install pynvim`

## Add node support to neovim
`sudo npm i -g neovim`

## install ripgrep
`sudo pacman -S ripgrep`

## install lldb-vscode debuger
`sudo pacman -S lldb`

## Run ssh-agent in the background

Create a systemd user service, by putting the following to ~/.config/systemd/user/ssh-agent.service:

```
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
```
Setup shell to have an environment variable for the socket (.bash_profile, .zshrc, config.fish):

```
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
```

Enable the service, so it'll be started automatically on login, and start it:

```
systemctl --user enable ssh-agent
systemctl --user start ssh-agent
```
Add the following configuration setting to your local ssh config file ~/.ssh/config

```
AddKeysToAgent  yes
```
