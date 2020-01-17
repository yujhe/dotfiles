#!/bin/zsh -e

params="-sf"
script_home="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Add our custom aliases to bash-it
ln $params $script_home/custom.aliases ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/custom.aliases

cd $script_home
# Symlink all of our dotfiles to the home directory
for i in .vimrc .dircolors .tmux.conf;
do
  ln $params $script_home/$i $HOME/$i
done

echo "reload dotfiles ..."
exec $SHELL -l
