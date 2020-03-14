#!/bin/bash -e

SYMBOLIC_PARAMS="-sf"
SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"

ln $SYMBOLIC_PARAMS $SCRIPT_HOME/custom.aliases $HOME/.bash_it/aliases/custom.aliases

echo "* link docker with bash-completion ..."
docker_resrc=/Applications/Docker.app/Contents/Resources
if [ -d $docker_resrc ]; then
  ln $SYMBOLIC_PARAMS $docker_resrc/etc/docker.bash-completion $(brew --prefix)/etc/bash_completion.d/docker
  ln $SYMBOLIC_PARAMS $docker_resrc/etc/docker-machine.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-machine
  ln $SYMBOLIC_PARAMS $docker_resrc/etc/docker-compose.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-compose
fi

# Symlink all of our dotfiles to the home directory
for i in .vimrc .dircolors .bashrc bash_profile .tmux.conf;
do
  ln $SYMBOLIC_PARAMS $SCRIPT_HOME/$i $HOME/$i
done

echo "reload dotfiles ..."
exec $SHELL -l
