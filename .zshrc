# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/scripts:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/jake/.oh-my-zsh

fpath+=/home/jake/.zfunc

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

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
ZSH_CUSTOM=$HOME/zsh_custom

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="kolo"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  cargo
  docker
  emoji
  kubectl
  dnf
)

source $ZSH/oh-my-zsh.sh
source /usr/share/fzf/shell/key-bindings.zsh
# gcloud
source /usr/share/google-cloud-sdk/completion.zsh.inc

# User configuration

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias python='/usr/bin/python3'
alias pip='/usr/bin/python3 -m pip'
alias spip='sudo /usr/bin/python3 -m pip'
alias i3lock='~/scripts/mmlock'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias copy='xclip -sel clip'
alias ls='exa'
alias grep='rg'
alias docker='podman'
alias grbm='git rebase main'
alias grbmm='git rebase master'
alias gcm='git checkout main'
alias gcmm='git checkout master'

function path_remove {
  # Delete path by parts so we can never accidentally remove sub paths
  PATH=${PATH//":$1:"/":"} # delete any instances in the middle
  PATH=${PATH/#"$1:"/} # delete any instance at the beginning
  PATH=${PATH/%":$1"/} # delete any instance in the at the end
}

function execpod(){
  kubectl exec -it $(kubectl get pods | grep -m1 $1 | grep -o '^\s*\S\+') /bin/bash
}

# added by travis gem
[ -f /home/jake/.travis/travis.sh ] && source /home/jake/.travis/travis.sh

# Add musl shims
export PATH=/usr/local/musl/bin:$PATH
# Add ark
export PATH="$HOME/.local/bin:$PATH"

# Add gh completions if they aren't already present
if [[ ! -d "$ZSH/completions" || ! -f "$ZSH/completions/_gh" ]]; then
    mkdir -pv $ZSH/completions
    gh completion --shell zsh > $ZSH/completions/_gh
    echo "gh added completions: gh completion --shell zsh > $ZSH/completions/_gh"
fi

# Force gcloud/gsutil to use python 2 because they are broken in python 3.9.
# I hate python.
export CLOUDSDK_PYTHON=python2

PATH="/home/jake/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/jake/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/jake/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/jake/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/jake/perl5"; export PERL_MM_OPT;
