# zsh configs

## Install


```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ln -s $(pwd)/themes/mmarchini.zsh-theme \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/mmarchini.zsh-theme
ln -s $(pwd)/.zsh-aliases ~/.zsh-aliases
ln -s $(pwd)/.zshrc ~/.zshrc
```

