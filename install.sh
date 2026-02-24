#!/usr/bin/env zsh

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install command line tools
if ! xcode-select -p &>/dev/null; then
  xcode-select --install
fi

# Install brew
if [[ -z $(command -v brew) ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

casks=(
  firefox
  visual-studio-code
  fork
  macpass
  ghostty
  notion
  whatsapp
  signal
  spotify
  todoist
)

for program in $casks; do
  if ! brew list --cask $program &>/dev/null; then
    brew install --cask $program
  fi
done

# Install first commands with brew
for program in autojump nodenv gh
do
  if [[ -z $(command -v $program) ]]; then
    brew install $program
  fi
done

# Install oh-my-zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH="${ZSH:-$HOME/.oh-my-zsh}"

# Install Rust toolchain
if [[ -z $(command -v rustup) ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Install cargo extensions
if [[ -z $(command -v cargo-nextest) ]]; then
  cargo install cargo-nextest
fi

ln -fhs "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
ln -fhs "$DOTFILES_DIR/zsh/custom/aliases.zsh" "$ZSH/custom/aliases.zsh"

mkdir -p "$HOME/.config/ghostty"
ln -fhs "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"

ln -fhs "$DOTFILES_DIR/.prettierrc" "$HOME/.prettierrc"

