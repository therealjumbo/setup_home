# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/home/jeff/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias nv="nvim"
alias vi="nvim"
alias ct=$'ctags -R --exclude=\".git\" --exclude=@.ctagsignore -L .srclist'
alias c='xclip'
alias v='xclip -o'
alias cs='xclip -selection clipboard'
alias vs='xclip -o -selection clipboard'
alias dirs='dirs -v'

for filename in ~/.zshrc.d/*.sh(.N); do
    if [ -e $filename ]
    then
        source $filename
    fi
done

# export DATABASE_URL=postgres:///$(whoami)

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

# variable for tmuxinator
export SHELL='/usr/bin/zsh'
export EDITOR='vim'

# go path
export GOPATH=~/workspace/go

# history specific options
setopt hist_allow_clobber
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt extended_history
setopt inc_append_history

unsetopt pushdignoredups
unsetopt autopushd

HISTSIZE=500000
SAVEHIST=500000

#eval `keychain --eval --agents ssh id_rsa`

alias lua=lua5.3

# rust stuff
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$HOME/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

# gnome-keyring-daemon creates the env var SSH_AUTH_SOCK with its value when it
# starts, if you login through ssh, and create a new terminal (e.g. in tmux)
# that env var is no longer visible. ssh-add needs this variable set in order to
# find your key from ssh-agent, so we find the value and export it here in case
# we are logging in through ssh, in order for this to work, the keyring must be
# unlocked at least once locally before the remote session can use it.
SSH_AUTH_SOCK="$(netstat -xl | grep -oE '/run/user/[0-9]+/keyring/ssh$')"
[ -z "$SSH_AUTH_SOCK" ] || export SSH_AUTH_SOCK

# workaround for bug in neovim https://github.com/neovim/neovim/issues/6982
export VTE_VERSION=0

# load zsh completion for docker-compose
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i