export ZDOTDIR=$HOME/.config/zsh

export BROWSER='librewolf'
export PDFVIEWER='librewolf'
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export TERMINAL='alacritty'

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export ANDROID_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export MYPY_CACHE_DIR="$XDG_CACHE_HOME"/.cache/mypy
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export PYENV_ROOT="$XDG_DATA_HOME"/pyenv
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
export WINEPREFIX="$XDG_DATA_HOME"/wine
# export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export ZSH="$XDG_DATA_HOME"/oh-my-zsh
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export _Z_DATA="$XDG_DATA_HOME/z"

source ~/.config/secrets

# export http_proxy="http://127.0.0.1:8118"
# export https_proxy="https://127.0.0.1:8118"

xset r rate 210 40
setxkbmap -option caps:escape

