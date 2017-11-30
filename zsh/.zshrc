# Path to your oh-my-zsh installation.
export ZSH=/Users/rantav/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(git noreallyjustfuckingstopalready)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
    #export EDITOR='vim'
#else
    #export EDITOR='vim'
#fi

export EDITOR='nvim'

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export PATH=/usr/local/share/python:$PATH

export GOPATH=$HOME/dev

# Golang 1.7 (installed via osx installer):
export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH

# Golang 1.8 (installed via brew):
# export PATH=/usr/local/opt/go/libexec/bin:$GOPATH/bin:$PATH


export NVM_DIR="/Users/rantav/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Use this as a default node version
nvm use v5.10

export PYSPARK_DRIVER_PYTHON=ipython


export SPARK_HOME=/etc/spark/spark-1.6.1-bin-hadoop2.6
export PATH="$SPARK_HOME/bin:$PATH"

alias git=hub

export PATH="/usr/local/terraform_0.8.2:$PATH"

. `brew --prefix`/etc/profile.d/z.sh

# For Bazel
export PATH="$PATH:$HOME/bin"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#alias nvim=~/nvim-osx64/bin/nvim
alias vi=nvim

# https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rantav/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/rantav/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rantav/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/rantav/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export GOOGLE_APPLICATION_CREDENTIALS=/Users/rantav/.gcp/analysis-cb731d18052f.json
