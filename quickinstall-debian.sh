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
ls ~/.config/nvim &>/dev/null && rm -rf  ~/.config/nvim
mkdir ~/.config/nvim
mv ./coc-settings.json  ~/.config/nvim
mv ./init.vim      ~/.config/nvim


dpkg -l | grep python &>/dev/null | |   if sudo apt install python 2> logs ; then
																						echo "python installation completed"
																					else
																						echo "python not be installed"
																					fi
dpkg -l | grep python-pip &>/dev/null || sudo apt install python-pip 2>logs
sudo apt install  neovim 2>logs
sudo apt install python3-neovim 2>logs
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
dpkg -l  | grep nodejs &> /dev/null || sudo apt install nodejs 2>logs
dpkg -l  | grep npm &> /dev/null  || sudo apt install npm 2>logs
dpkg -l  | grep cmdtest &> /dev/null || sudo apt install cmdtest 2>logs
dpkg -l  | grep ctags &> /dev/null || sudo apt install ctags 2>logs
dpkg -l  | grep clang &> /dev/null || sudo apt install clang 2>logs
pip install debugpy jedi 2>logs
sudo npm i intelephense -g 2>logs

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo apt install fonts-powerline
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
echo""
echo""
echo " _           _        _ _                             _      _           _ "
echo "(_)_ __  ___| |_ __ _| | |   ___ ___  _ __ ___  _ __ | | ___| |_ ___  __| |"
echo "| | '_ \/ __| __/ _` | | |  / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \/ _` |"
echo "| | | | \__ \ || (_| | | | | (_| (_) | | | | | | |_) | |  __/ ||  __/ (_| |"
echo "|_|_| |_|___/\__\__,_|_|_|  \___\___/|_| |_| |_| .__/|_|\___|\__\___|\__,_|"
echo "                                               |_|                         "

