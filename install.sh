#!/bin/bash -e

script_home="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
packages_file="$script_home/packages.txt"

echo "start to install packages in $packages_file ..."

# check brew is installed
if ! which -s brew; then
  echo "ERROR: please install brew"
  exit 1
fi

# git
if grep -Fxq "git" $packages_file; then
  echo "* install git ..."
  if [ ! -d $(brew --prefix git) ]; then
    echo "start to install git"
    brew install git
  else
    echo "git is already installed"
  fi
fi

# anyenv
if grep -Fxq "anyenv" $packages_file; then
  echo "* install anyenv ..."
  if [ ! -d $HOME/.anyenv ]; then
    echo "start to install anyenv"
    git clone https://github.com/riywo/anyenv $HOME/.anyenv
  else
    echo "anyenv is already installed"
  fi
fi

# bash-it
if grep -Fxq "bash-it" $packages_file; then
  echo "* install bash-it ..."
  if [ ! -d $HOME/.bash_it ]; then
    echo "start to install bash-it"
    git clone --depth=1 https://github.com/Bash-it/bash-it.git $HOME/.bash_it
  else
    echo "bash-it is already installed"
  fi
fi

# bash-completion
if grep -Fxq "bash-completion" $packages_file; then
  echo "* install bash-completion ..."
  if [ ! -d $(brew --prefix bash-completion) ]; then
    echo "start to install bash-completion"
    brew install bash-completion
  else
    echo "bash-completion is already installed"
  fi
fi

# bat
if grep -Fxq "bat" $packages_file; then
  echo "* install bat ..."
  if [ ! -d $(brew --prefix bat) ]; then
    echo "start to install bat"
    brew install bat
  else
    echo "bat is already installed"
  fi
fi

# coreutils
echo "* install coreutils ..."
if [ ! -d $(brew --prefix coreutils) ]; then
  echo "start to install coreutils"
  brew install coreutils
else
  echo "coreutils is already installed"
fi

# diff-so-fancy
if grep -Fxq "diff-so-fancy" $packages_file; then
  echo "* install diff-so-fancy ..."
  if [ ! -d $(brew --prefix diff-so-fancy) ]; then
    echo "start to install diff-so-fancy"
    brew install diff-so-fancy
    
    git config --global pager.diff "diff-so-fancy | less --tabs=1,5 -RFX"
    git config --global pager.show "diff-so-fancy | less --tabs=1,5 -RFX"
    
    git config --global color.ui true
    
    git config --global color.diff-highlight.oldNormal    "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal    "green bold"
    git config --global color.diff-highlight.newHighlight "green bold 22"
    
    git config --global color.diff.meta       "yellow"
    git config --global color.diff.frag       "magenta bold"
    git config --global color.diff.commit     "yellow bold"
    git config --global color.diff.old        "red bold"
    git config --global color.diff.new        "green bold"
    git config --global color.diff.whitespace "red reverse"
  else
    echo "diff-so-fancy is already installed"
  fi
fi

# docker
if grep -Fxq "docker" $packages_file; then
  echo "* install docker ..."
  if ! which -s brew; then
    echo "start to install docker"
    brew cask install docker
  else
    echo "docker is already installed"
  fi
fi

# fzf
if grep -Fxq "fzf" $packages_file; then
  echo "* install fzf ..."
  if [ ! -d $(brew --prefix fzf) ]; then
    echo "start to install fzf"
    brew install fzf
    # To install useful key bindings and fuzzy completion:
    printf 'y\ny\nn\n' | $(brew --prefix)/opt/fzf/install
  else
    echo "fzf is already installed"
  fi
fi

# jq
if grep -Fxq "jq" $packages_file; then
  echo "* install jq ..."
  if [ ! -d $(brew --prefix jq) ]; then
    echo "start to install jq"
    brew install jq
  else
    echo "jq is already installed"
  fi
fi

# tldr
if grep -Fxq "tldr" $packages_file; then
  echo "* install tldr ..."
  if [ ! -d $(brew --prefix tldr) ]; then
    echo "start to install tldr"
    brew install tldr
  else
    echo "tldr is already installed"
  fi
fi

# tmux
if grep -Fxq "tmux" $packages_file; then
  echo "* install tmux ..."
  if [ ! -d $(brew --prefix tmux) ]; then
    echo "start to install tmux"
    brew install tmux
  else
    echo "tmux is already installed"
  fi
fi

# tmux-plugins
if grep -Fxq "tmux-plugins" $packages_file; then
  echo "* install tmux-plugins ..."
  if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    echo "start to install tmux-plugins"
		git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
  else
    echo "tmux-plugins is already installed"
  fi
fi

# tree
if grep -Fxq "tree" $packages_file; then
  echo "* install tree ..."
  if [ ! -d $(brew --prefix tree) ]; then
    echo "start to install tree"
		brew install tree
  else
    echo "tree is already installed"
  fi
fi

# theme
if [ ! -f $HOME/.vim/colors/solarized.vim ]; then
  echo "* add solarized colors for vim ..."
  curl -fLo $HOME/.vim/colors/solarized.vim --create-dirs \
  https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
fi

cd $script_home
