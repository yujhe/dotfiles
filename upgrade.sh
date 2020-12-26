#!/bin/sh -e

SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"

source $SCRIPT_HOME/packages.sh

printf "checking Homebrew is installed or not: "
if ! which -s brew; then
  echo "(x) homebrew is required"
  exit 1
else
  echo "(v) homebrew is installed"
  brew update
fi

printf "checking Git is installed or not: "
if [ ! -d $(brew --prefix git) ]; then
  echo "(x) git is required"
  exit 1
else
  echo "(v) git is installed"
  brew upgrade git
fi

echo "start to upgrade packages: ${PACKAGES[@]}"
for pkg in ${PACKAGES[@]}
do
  echo "upgrade package: $pkg"
  case $pkg in
    anyenv )
      if [ -d $HOME/.anyenv ]; then
        cd $HOME/.anyenv && git pull && cd -
      fi;;
    bat )
      brew upgrade -f bat;;
    coreutils )
      brew upgrade -f coreutils;;
    diff-so-fancy )
      brew upgrade -f diff-so-fancy;;
    fzf )
      brew upgrade -f fzf
      printf 'y\ny\nn\n' | $(brew --prefix fzf)/install # set useful key bindings and fuzzy completion
      ;;
    jq )
      brew upgrade -f jq;;
    tldr )
      brew upgrade -f tldr;;
    tmux )
      brew upgrade tmux
      cd $HOME/.tmux/plugins/tpm && git pull && cd -;;
    tree )
      brew upgrade -f tree;;
    * )
      echo "undefined package: $pkg, please add to upgrade.sh"
      exit 1;;
  esac
done

while true; do
  read -p "Do you wish to upgrade packages for Bash? (Y/n) " yn
  case $yn in
      [Nn] ) break;;
      * )
        echo "start to upgrade packages for Bash: ${BASH_PACKAGES[@]}"
        for pkg in ${BASH_PACKAGES[@]}
        do
          case $pkg in
            bash-it )
              cd $HOME/.bash_it && git pull && cd -;;
            bash-completion )
              brew upgrade -f bash-completion;;
            * )
              echo "undefined package: $pkg, please add to upgrade.sh"
              exit 1;;
          esac
        done
        break;;
  esac
done

while true; do
  read -p "Do you wish to upgrade packages for Zsh? (Y/n) " yn
  case $yn in
      [Nn] ) break;;
      * )
        echo "start to upgrade packages for Zsh: ${ZSH_PACKAGES[@]}"
        for pkg in ${ZSH_PACKAGES[@]}
        do
          case $pkg in
            oh-my-zsh )
              env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh;;
            zsh-completions )
              cd $HOME/.oh-my-zsh/custom/plugins/zsh-completions && git pull && cd -;;
            zsh-syntax-highlighting )
              cd $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git pull && cd -;;
            * )
              echo "undefined package: $pkg, please add to upgrade.sh"
              exit 1;;
          esac
        done
        break;;
  esac
done

