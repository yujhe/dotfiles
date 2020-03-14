#!/bin/zsh -e

SYMBOLIC_PARAMS="-sf"
SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"

echo $SCRIPT_HOME

ln $SYMBOLIC_PARAMS $SCRIPT_HOME/custom.aliases $HOME/.oh-my-zsh/custom/custom.aliases

# Symlink all of our dotfiles to the home directory
for i in .vimrc .dircolors .tmux.conf .zshrc;
do
  ln $SYMBOLIC_PARAMS $SCRIPT_HOME/$i $HOME/$i
done

echo "reload dotfiles ..."
exec $SHELL -l
