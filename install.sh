#!/usr/bin/env zsh

PWD=$(pwd)

ln -fhs "$PWD/zsh/.zshrc" ~/.zshrc
ln -fhs "$PWD/zsh/custom/" ~/.oh-my-zsh/custom
