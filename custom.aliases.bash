alias ls="ls -hp --color=always"
alias ll='ls -halp --color=always'
alias grep="grep --color=always"
alias egrep="egrep --color=always"
alias gc="git commit -S -v"
alias gcm="git commit -S -v -m"
alias sudo="sudo -E"

# Commit and push everything
gitdone() { git add -A; git commit -S -v -m "$1"; git push; }
