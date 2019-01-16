# tmux

`tmux` config files

## Install

```bash
mkdir -p ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
```

Add `*/1 * * * * ~/.mutt/scripts/tmux-set-left-statusbar` to the user's crontab.
