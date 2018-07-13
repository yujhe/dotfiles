# dotfiles

This is my personal collection of dotfile customizations. Includes [anyenv](https://github.com/riywo/anyenv), [bash-it](https://github.com/Bash-it/bash-it), bash-completion, docker auto-completion, git, jq, tmux, tpm (tmux plugins manager).

Setup is simple. Just run `setup.sh` and it will symlink all of the dotfiles into your home directory. The symlink allows you to automatically receive any updates after running a `git pull` in the future.

Pre-requirements:
* Install [brew](https://brew.sh/index_zh-tw)
* (Optional) Install [docker](https://www.docker.com/) for docker auto-completion
