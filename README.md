# dotfiles

This is my personal collection of dotfile customizations.

* [anyenv](https://github.com/riywo/anyenv): all in one for \*\*env
* auto-completion
* [bash-it](https://github.com/Bash-it/bash-it): a collection of community Bash commands and scripts
* bash-completion
* docker auto-completion setup
* git, git auto-completion setup
* [jq](https://stedolan.github.io/jq/): lightweight and flexible command-line JSON processor
* tmux: terminal multiplexer
* tpm (tmux plugins manager)
* tree: a recursive directory listing command that produces a depth indented listing of files

# Setup
Setup is simple. Just run `setup.sh` and it will symlink all of the dotfiles into your home directory. The symlink allows you to automatically receive any updates after running a `git pull` in the future.

# Pre-requirements

* [brew](https://brew.sh/index_zh-tw)

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

* (Optional) [docker](https://www.docker.com/)

```shell
brew cask install docker
```
