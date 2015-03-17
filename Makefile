default: install

dependencies:
	@command -v stow >/dev/null 2>&1 || brew install stow 2>/dev/null || sudo apt-get install -y stow 2>/dev/null || sudo yum install -y stow 2>/dev/null || { echo >&2 "Please install GNU stow"; exit 1; }
	git submodule init
	git submodule update

stow:
	stow git
	stow screen
	stow tmux
	stow vim
	stow zsh

chsh:
	chsh -s `which zsh`

install: dependencies stow chsh
