# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.local/bin:

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="nova"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(z git zsh-autosuggestions zsh-syntax-highlighting colorize colored-man-pages node sudo)

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# pyenv
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# pipenv
export PIPENV_VERBOSITY=-1
export PIPENV_VENV_IN_PROJECT=1

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

source ~/.config/aliases

pfetch
colorscript random

# bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"
# [ -s "/home/body20002/.bun/_bun" ] && source "/home/body20002/.bun/_bun"

# zsh parameter completion for the dotnet CLI
# _dotnet_zsh_complete()
# {
#     local completions=("$(dotnet complete "$words")")
#
#     reply=( "${(ps:\n:)completions}" )
# }
#
# compctl -K _dotnet_zsh_complete dotnet

# if [ -z "${TMUX}" ]; then
#     (cat ~/.cache/wal/sequences &)
#     source ~/.cache/wal/colors-tty.sh
# fi
