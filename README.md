# .dotfiles

My personal collection of config files.

- [Install](#install)
  - [Clone repo](#clone-repo)
  - [Brew](#brew)
  - [Install Packages](#install-packages)
  - [Link configuration](#link-configuration)
- [Uninstall](#uninstall)

## Install

Please follow the below steps to make sure, that everything is working correctly.

### Clone repo

Before we start, you need to clone this repository

```zsh
git clone git@github.com:kl0sin/.dotfiles.git
```

and after go `.dotfiles` directory.

```zsh
cd .dotfiles/
```

### Brew

Make sure you have `HomeBrew` installed, if not - install it

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install Packages

Install all needed packages defined in the `Brewfile`

```zsh
brew bundle
```

### Link configuration

Create symlinks in your `$HOME` directory using `stow` by running:

```zsh
./install
```

## Uninstall

To remove symlinks from you `$HOME` directory run:

```zsh
./uninstall
```

> Everything was prepared using `zsh` and `masOS Monterey 12.2`. Some issues my happen during the installation process. Feel free to open `Pull Request` if you want to help.
