# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export PATH=/usr/lib/google-dartlang/bin:${PATH}

# Dotfiles Management system
source $HOME/.dotfilesrc

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

## STUPID PROMPT EXPERIMENT THAT WASTED AN HOUR OF MY LIFE
# autoload -Uz promptinit; promptinit
# setopt PROMPT_SUBST
# 
# normal_mode() {
#   echo "%F{green}[N]%F{reset_color}"
# }
# 
# insert_mode() {
#   echo "%F{cyan}[I]%F{reset_color}"
# }
# 
# zle-keymap-select() {
# }
# 
# build_prompt() {
#   vi_mode=$(insert_mode)
#   if [ "^Q" ]; then
#     if [[ ${KEYMAP} == "vicmd" ]]; then
#       vi_mode="$(normal_mode)"
#     fi
#   fi
#   date_string=$(date +"%y-%m-%d %H:%M:%S %z")
#   PROMPT="%F{cyan}$(three_dir_pwd)%F{reset_color} at %F{yellow}$date_string $vi_mode %B%F{green}→ %b%F{reset_color}"
#   RPROMPT="$(fig_commit_desc)"
# }
# 
# precmd_functions+=build_prompt
# build_prompt
# 
# function zle-line-init zle-keymap-select {
#   build_prompt
#   zle reset-prompt
# }
# 
# zle -N zle-line-init
# zle -N zle-keymap-select

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
# Uncommented as it was causing the previous command to be printed
# before the result of the command... for some reason. Something to do
# with using screen / TERM in an inappropriate context.
DISABLE_AUTO_TITLE="true"

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
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

KEYTIMEOUT=10 # 100ms for key sequences. Make Esc faster.

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# export MANPATH="/usr/local/man:$MANPATH"

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
#

# Hopefully fixes random Vim freezing problem.
stty -ixon
