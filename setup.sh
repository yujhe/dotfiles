#!/bin/bash -e

params="-sf"

while getopts "vib" args; do
    case $args in
        v)
            params="$params -v"
            ;;
        i)
            params="$params -i"
            ;;
        b)
            params="$params -b"
            ;;
    esac
done

# Store where the script was called from so we can reference it later
script_home="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo '* install git...'
if [ ! -d $(brew --prefix git) ]; then
  echo 'start installing git'
  brew install git
else
  echo 'git is already installed'
fi


echo '* install bash-it...'
if [ -d $HOME/.bash_it ]; then
  echo 'bash-it is already installed, update to up to date'
  cd $HOME/.bash_it
  git pull
else
  echo 'start installing bash-it'
  git clone --depth=1 https://github.com/Bash-it/bash-it.git $HOME/.bash_it
fi
# Add our custom aliases to bash-it
ln $params $script_home/custom.aliases.bash $HOME/.bash_it/aliases/custom.aliases.bash


echo '* install coreutils...'
if [ ! -d $(brew --prefix coreutils) ]; then
  echo 'start installing coreutils'
  brew install coreutils
else
  echo 'coreutils is installed'
fi


echo '* install bash-completion...'
if [ ! -d $(brew --prefix bash-completion) ]; then
  echo 'start installing bash-completion'
  brew install bash-completion
else
  echo 'bash-completion is already installed'
fi


echo '* install tmux...'
if [ ! -d $(brew --prefix tmux) ]; then
  echo 'start installing tmux'
  brew install tmux
else
  echo 'tmux is already installed'
fi


echo '* install tmux plugin manager...'
if [ ! -d $HOME/.tmux/plugins/tpm ]; then
  echo 'start installing tmux plugin manager'
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
else
  echo 'tmux plugin manager is already installed'
fi


echo '* install anyenv...'
if [ ! -d $HOME/.anyenv ]; then
  echo 'start installing anyenv'
  git clone https://github.com/riywo/anyenv $HOME/.anyenv
else
  echo 'anyenv is already installed, update to up to date'
  cd $HOME/.anyenv
  git pull
fi


echo '* install jq...'
if [ ! -d $(brew --prefix jq) ]; then
  echo 'start installing jq'
  brew install jq
else
  echo 'jq is already installed'
fi


echo '* add solarized colors for vim...'
if [ ! -f $HOME/.vim/colors/solarized.vim ]; then
  curl -fLo $HOME/.vim/colors/solarized.vim --create-dirs \
  https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
fi

echo '* link docker bash-completion...'
docker_resrc=/Applications/Docker.app/Contents/Resources
if [ -d $docker_resrc ]; then
  ln -sf $docker_resrc/etc/docker.bash-completion $(brew --prefix)/etc/bash_completion.d/docker
  ln -sf $docker_resrc/etc/docker-machine.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-machine
  ln -sf $docker_resrc/etc/docker-compose.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-compose
fi

# Symlink all of our dotfiles to the home directory
for i in .vimrc .dircolors .bashrc .bash_profile .tmux.conf;
do
  ln $params $script_home/$i $HOME/$i
done
