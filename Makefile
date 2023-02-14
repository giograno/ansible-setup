.PHONY: install-brew, install-xcode

install-xcode:
	xcode-select --install

install-brew:
	# this step installs home brew and ansible
	if [ ! "$$(command -v brew)" ]; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
	(echo; echo 'eval "$$(/opt/homebrew/bin/brew shellenv)"') >> /Users/giograno/.zprofile
	eval "$$(/opt/homebrew/bin/brew shellenv)"
	brew update
	brew install ansible

setup-ansible:
	# do the entire setup with ansible
	# - install all home brew packages
	# - setup SSH keys
	# - setup shell, fzf, oh-my-zsh
	# - setup dotfiles with stow
	# - setup mac os things