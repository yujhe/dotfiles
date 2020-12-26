#!/bin/sh -e

SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"

source $SCRIPT_HOME/packages.sh

printf "checking Homebrew is installed or not: "
if ! which -s brew; then
  while true; do
    read -p "Homebrew is required, do you wish to install? (Y/n) " yn
    case $yn in
        [Nn] ) exit;;
        * )
          /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
          break;;
    esac
  done
else
  echo "(v) homebrew is installed"
fi

printf "checking Git is installed or not: "
if [ ! -d $(brew --prefix git) ]; then
  while true; do
    read -p "Git is required, do you wish to install? (Y/n) " yn
    case $yn in
        [Nn] ) exit;;
        * ) brew install git; break;;
    esac
  done
else
  echo "(v) git is installed"
fi

echo "start to install packages: ${PACKAGES[@]}"
for pkg in ${PACKAGES[@]}
do
  printf "checking $pkg is installed or not: "
  case $pkg in
    anyenv )
      if [ ! -d $HOME/.anyenv ]; then
        git clone https://github.com/riywo/anyenv $HOME/.anyenv
        continue
      fi;;
    bat )
      if [ ! -d $(brew --prefix bat) ]; then
        brew install bat
        continue
      fi;;
    coreutils )
      if [ ! -d $(brew --prefix coreutils) ]; then
        brew install coreutils
        continue
      fi;;
    diff-so-fancy )
      if [ ! -d $(brew --prefix diff-so-fancy) ]; then
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
        git config --bool --global diff-so-fancy.stripLeadingSymbols false
        continue
      fi;;
    fzf )
      if [ ! -d $(brew --prefix fzf) ]; then
        brew install fzf
        printf 'y\ny\nn\n' | $(brew --prefix fzf)/install # set useful key bindings and fuzzy completion
        continue
      fi;;
    jq )
      if [ ! -d $(brew --prefix jq) ]; then
        brew install jq
        continue
      fi;;
    tldr )
      if [ ! -d $(brew --prefix tldr) ]; then
        brew install tldr
        continue
      fi;;
    tmux )
      if [ ! -d $(brew --prefix tmux) ]; then
        brew install tmux
		    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
        continue
      fi;;
    tree )
      if [ ! -d $(brew --prefix tree) ]; then
        brew install tree
        continue
      fi;;
    * )
      echo "undefined package: $pkg, please add to install.sh"
      continue;;
  esac
  echo "(v) $pkg is installed"
done


while true; do
  read -p "Do you wish to install packages for Bash? (Y/n) " yn
  case $yn in
      [Nn] ) break;;
      * )
        echo "start to install packages for bash: ${BASH_PACKAGES[@]}"
        for pkg in ${BASH_PACKAGES[@]}
        do
          case $pkg in
            bash-it )
              if [ ! -d $HOME/.bash_it ]; then
                git clone --depth=1 https://github.com/Bash-it/bash-it.git $HOME/.bash_it
                continue
              fi;;
            bash-completion )
              if [ ! -d $(brew --prefix bash-completion) ]; then
                brew install bash-completion
                continue
              fi;;
            * )
              echo "undefined package: $pkg, please add to install.sh"
              continue;;
          esac
          echo "(v) $pkg is installed"
        done
        break;;
  esac
done

while true; do
  read -p "Do you wish to install packages for Zsh? (Y/n) " yn
  case $yn in
      [Nn] ) break;;
      * )
        echo "start to install packages for Zsh: ${ZSH_PACKAGES[@]}"
        for pkg in ${ZSH_PACKAGES[@]}
        do
          case $pkg in
            oh-my-zsh )
              if [ ! -d $HOME/.oh-my-zsh ]; then
                sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
                continue
              fi;;
            zsh-completions )
              if [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-completions ]; then
                git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions
                continue
              fi;;
            zsh-syntax-highlighting )
              if [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
                git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
                continue
              fi;;
            * )
              echo "undefined package: $pkg, please add to install.sh"
              continue;;
          esac
          echo "(v) $pkg is installed"
        done
        break;;
  esac
done

echo "adding favoriate themes"
if [ ! -f $HOME/.vim/colors/solarized.vim ]; then
  curl -fLo $HOME/.vim/colors/solarized.vim --create-dirs https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
fi
if [ ! -f $HOME/.vim/colors/apprentice.vim ]; then
  curl -fLo $HOME/.vim/colors/apprentice.vim --create-dirs https://raw.githubusercontent.com/romainl/Apprentice/master/colors/apprentice.vim
fi
