#!/bin/bash
echo " __________________________________________  "
echo "/ Need python3 nodejs npm yarn debugpy     \ "
echo "| jedi intelephense fzf ctags clang ccls   | "
echo "| nerd-fonts powerline-fonts.              | "
echo "| if no errors we will help you install    | "
echo "| these,if someone not be installed then   | "
echo "| you have to install it manully,and       | "
echo "\ eorrs (if have) will be record in screen./ "
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
mv ./coc-settings.json   ~/.config/nvim
mv ./init.vim    ~/.config/nvim

pacman -Q | grep python &>/dev/null ||   if sudo pacman -S python  ; then
																						echo "python installation completed"
																					else
																						echo "python not be installed"
																					fi
sudo pacman -S pip-tools
sudo pacman -S neovim
sudo pacman -S python-pynvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pacman -Q | grep nodejs &> /dev/null || sudo pacman -S nodejs
pacman -Q | grep npm &> /dev/null  || sudo pacman -S npm
pacman -Q | grep yarn &> /dev/null || sudo pacman -S yarn
pacman -Q | grep fzf &> /dev/null  || sudo pacman -S fzf
pacman -Q | grep ctags &> /dev/null || sudo pacman -S ctags
pacman -Q | grep ccls &> /dev/null  || sudo pacman -S ccls
pacman -Q | grep clang &> /dev/null || sudo pacman -S clang
pip install debugpy jedi
sudo npm i intelephense -g


sudo pacman -S powerline-fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

sudo fc-cache -fv
echo ""
echo ""
echo "  _           _        _ _                             _      _           _  "
echo " (_)_ __  ___| |_ __ _| | |   ___ ___  _ __ ___  _ __ | | ___| |_ ___  __| | "
echo ' | | '_ \/ __| __/ _` | | |  / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \/ _` | '
echo ' | | | | \__ \ || (_| | | | | (_| (_) | | | | | | |_) | |  __/ ||  __/ (_| | '
echo ' |_|_| |_|___/\__\__,_|_|_|  \___\___/|_| |_| |_| .__/|_|\___|\__\___|\__,_| '
echo '                                               |_|                           '
echo "                                                                                    "
