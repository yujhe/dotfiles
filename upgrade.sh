#!/bin/bash -e

script_home="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
packages_file="$script_home/packages.txt"

echo "start to upgrade packages in $packages_file ..."

# check brew is installed
if ! which -s brew; then
  echo "ERROR: please install brew"
  exit 1
else
  brew update
fi

# git
if grep -Fxq "git" $packages_file; then
  echo "* upgrade git ..."
  if [ ! -d $(brew --prefix git) ]; then
    echo "git is not installed"
    exit 1
  else
    echo "start to upgrade git"
    brew reinstall git
  fi
fi

# anyenv
if grep -Fxq "anyenv" $packages_file; then
  echo "* upgrade anyenv ..."
  if [ ! -d $HOME/.anyenv ]; then
    echo "anyenv is not installed"
    exit 1
  else
    echo "start to upgrade anyenv"
    cd $HOME/.anyenv; git pull
  fi
fi

# bash-it
if grep -Fxq "bash-it" $packages_file; then
  echo "* upgrade bash-it ..."
  if [ ! -d $HOME/.bash_it ]; then
    echo "bash-it is not installed"
    exit 1
  else
    echo "start to upgrade bash-it"
    cd $HOME/.bash_it; git pull
  fi
fi

# bash-completion
if grep -Fxq "bash-completion" $packages_file; then
  echo "* upgrade bash-completion ..."
  if [ ! -d $(brew --prefix bash-completion) ]; then
    echo "bash-completion is not installed"
    exit 1
  else
    echo "start to upgrade bash-completion"
    brew reinstall bash-completion
  fi
fi

# bat
if grep -Fxq "bat" $packages_file; then
  echo "* upgrade bat ..."
  if [ ! -d $(brew --prefix bat) ]; then
    echo "bat is not installed"
    exit 1
  else
    echo "start to upgrade bat"
    brew reinstall bat
  fi
fi

# coreutils
echo "* upgrade coreutils ..."
if [ ! -d $(brew --prefix coreutils) ]; then
  echo "coreutils is not installed"
  exit 1
else
  echo "start to upgrade coreutils"
  brew reinstall coreutils
fi

# diff-so-fancy
if grep -Fxq "diff-so-fancy" $packages_file; then
	echo "* upgrade diff-so-fancy ..."
	if [ ! -d $(brew --prefix diff-so-fancy) ]; then
  	echo "diff-so-fancy is not installed"
    exit 1
	else
  	echo "start to upgrade diff-so-fancy"
  	brew reinstall diff-so-fancy
	fi
fi

# fzf
if grep -Fxq "fzf" $packages_file; then
  echo "* upgrade fzf ..."
  if [ ! -d $(brew --prefix fzf) ]; then
    echo "fzf is not installed"
    exit 1
  else
    echo "start to upgrade fzf"
    brew reinstall fzf
  fi
fi

# jq
if grep -Fxq "jq" $packages_file; then
  echo "* upgrade jq ..."
  if [ ! -d $(brew --prefix jq) ]; then
    echo "jq is not installed"
    exit 1
  else
    echo "start to upgrade jq"
    brew reinstall jq
  fi
fi

# tldr
if grep -Fxq "tldr" $packages_file; then
  echo "* upgrade tldr ..."
  if [ ! -d $(brew --prefix tldr) ]; then
    echo "tldr is not installed"
    exit 1
  else
    echo "start to upgrade tldr"
    brew reinstall tldr
  fi
fi

# tmux
if grep -Fxq "tmux" $packages_file; then
  echo "* upgrade tmux ..."
  if [ ! -d $(brew --prefix tmux) ]; then
    echo "tmux is not installed"
    exit 1
  else
    echo "start to upgrade tmux"
    brew reinstall tmux
  fi
fi

# tmux-plugins
if grep -Fxq "tmux-plugins" $packages_file; then
  echo "* upgrade tmux-plugins ..."
  if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    echo "tmux-plugins is not installed"
    exit 1
  else
    echo "start to upgrade tmux-plugins"
    cd $HOME/.tmux/plugins/tpm; git pull
  fi
fi

# tree
if grep -Fxq "tree" $packages_file; then
  echo "* upgrade tree ..."
  if [ ! -d $(brew --prefix tree) ]; then
    echo "tree is not installed"
    exit 1
  else
    echo "start to upgrade tree"
		brew reinstall tree
  fi
fi

cd $script_home
