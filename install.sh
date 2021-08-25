#!/usr/bin/env zsh

PWD=$(pwd)

# Install command line tools
if [[ -z $(command -v xcode-select) ]]; then
  xcode-select --install
fi

# Install brew
if [[ -z $(command -v brew) ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install first stuff with brew
for program in autojump rbenv nodenv
do
  if [[ -z $(command -v $program) ]]; then
    brew install $program
  fi
done

# Install oh-my-zsh
if [[ -z "$ZSH" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ln -fhs "$PWD/zsh/.zshrc" "$HOME/.zshrc"
ln -fhs "$PWD/zsh/custom/aliases.zsh" "$ZSH/custom/aliases.zsh"

ln -fhs "$PWD/.prettierrc" "$HOME/.prettierrc"

cp "$PWD/com.apple.Terminal.plist" "$HOME/Library/Preferences/com.apple.Terminal.plist"

