# zsh configs

## Install


```bash
sudo apt install xclip zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ln -s $(pwd)/themes/mmarchini.zsh-theme \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/mmarchini.zsh-theme
ln -s $(pwd)/.zsh-aliases ~/.zsh-aliases
mv ~/.zshrc ~/.zshrc.bkp
ln -s $(pwd)/.zshrc ~/.zshrc

# Some commonly used CLI tools
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```

