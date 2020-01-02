#!/bin/bash -e

params="-sf"
script_home="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Add our custom aliases to bash-it
ln $params $script_home/custom.aliases $HOME/.bash_it/aliases/custom.aliases

echo "* link docker with bash-completion ..."
docker_resrc=/Applications/Docker.app/Contents/Resources
if [ -d $docker_resrc ]; then
  ln $params $docker_resrc/etc/docker.bash-completion $(brew --prefix)/etc/bash_completion.d/docker
  ln $params $docker_resrc/etc/docker-machine.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-machine
  ln $params $docker_resrc/etc/docker-compose.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-compose
fi

cd $script_home
# Symlink all of our dotfiles to the home directory
for i in .vimrc .dircolors .bashrc .bash_profile .tmux.conf;
do
  ln $params $script_home/$i $HOME/$i
done

echo "reload dotfiles ..."
exec $SHELL -l
