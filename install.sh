#!/usr/bin/env zsh

PWD=$(pwd)

ln -fhs "$PWD/zsh/.zshrc" ~/.zshrc
ln -fhs "$PWD/zsh/custom/aliases.zsh" ~/.oh-my-zsh/custom/aliases.zsh

ln -fhs "$PWD/.prettierrc" ~/.prettierrc
