#!/bin/bash
echo " __________________________________________  "
echo "/ Need python3 nodejs npm yarn debugpy     \ "
echo "| jedi intelephense fzf ctags clang ccls   | "
echo "| nerd-fonts powerline-fonts.              | "
echo "| if no errors we will help you install    | "
echo "| these,if someone not be installed then   | "
echo "| you have to install it manully,and       | "
echo "\ eorrs (if have) will be record in logs.  / "
echo " ------------------------------------------  "
echo "        \   ^__^                             "
echo "         \  (oo)\_______                     "
echo "            (__)\       )\/\                 "
echo "                ||----w |                    "
echo "                ||     ||                    "
sleep 5
echo "installing..."
ls ~/.config/nvim &>/dev/null || rm -rf  ~/.config/nvim
mkdir ~/.config/nvim

pacman -Q | grep python &>/dev/null | |   if sudo pacman -S python 2> logs ; then
																						echo "python installation completed"
																					else
																						echo "python not be installed"
																					fi
sudo pacman -S pip-tools 2>logs
sudo pacman -S neovim 2>logs
sudo pacman -S python-pynvim 2>logs
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pacman -Q | grep nodejs &> /dev/null || sudo pacman -S nodejs 2>logs
pacman -Q | grep npm &> /dev/null  || sudo pacman -S npm 2>logs
pacman -Q | grep yarn &> /dev/null || sudo pacman -S yarn 2>logs
pacman -Q | grep fzf &> /dev/null  || sudo pacman -S fzf 2>logs
pacman -Q | grep ctags &> /dev/null || sudo pacman -S ctags 2>logs
pacman -Q | grep ccls &> /dev/null  || sudo pacman -S ccls 2>logs
pacman -Q | grep clang &> /dev/null || sudo pacman -S clang 2>logs
pip install debugpy jedi 2>logs
sudo npm i intelephense -g 2>logs
