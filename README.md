# dotfiles

My personal dotfiles.

## Packages
* [anyenv](https://github.com/riywo/anyenv): all in one for \*\*env
* [bash-it](https://github.com/Bash-it/bash-it): a collection of community Bash commands and scripts
* bash-completion
* [bat](https://github.com/sharkdp/bat): a cat(1) clone with syntax highlighting and Git integration
* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy): strives to make your diff's human readable instead of machine readable
* [docker](https://www.docker.com/)
* [fzf](https://github.com/junegunn/fzf): a general-purpose command-line fuzzy finder
* git
* [jq](https://stedolan.github.io/jq/): lightweight and flexible command-line JSON processor
* [tldr](https://tldr.sh/): simplify the beloved man pages with practical examples
* tmux: terminal multiplexer
* tpm (tmux plugins manager)
* tree: a recursive directory listing command that produces a depth indented listing of files

# Setup
Setup is easy. Run `install.sh` for packages installation, `upgrade.sh` to for packages upgrade, `setup.sh` for symbolic link all dotfiles.

* [install.sh](./install.sh): Install packages in packages.txt (only support the above [packages](#Packages)).
* [upgrade.sh](./upgrade.sh): Upgrade installed packages in packages.txt (only support the above [packages](#Packages)).
* [setup.sh](./setup.sh): Symbolic link dotfiles into your home directory, it allows you to automatically receive any updates after running a `git pull` in the future. 

# Pre-requirements

* [brew](https://brew.sh/index_zh-tw)

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
