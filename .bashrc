# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Add coreutils bin dir to path
if [ -d /usr/local/opt/coreutils/libexec ]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

# dircolors
if [ -e ~/.dircolors ]; then
  eval `dircolors -b ~/.dircolors`
fi

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='sexy'

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Tab complete sudo commands
complete -cf sudo

# Load Bash It
export BASH_IT="$HOME/.bash_it"

if [ -e $BASH_IT/bash_it.sh ]; then
  source $BASH_IT/bash_it.sh
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -d /usr/local/opt/python/libexec/bin ]; then
  export PATH="/usr/local/opt/python/libexec/bin:$PATH"
fi

# Fix vim colors inside tmux
if [ -n $TMUX ]; then
  alias vim="TERM=screen-256color vim"
fi

# Set default editor to vim
export EDITOR=vim

# Load anyenv
if [ -d ${HOME}/.anyenv/bin ]; then
  export PATH="${HOME}/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# Load bash-completion
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  source `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi
