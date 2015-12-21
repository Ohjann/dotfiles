# Path to your oh-my-zsh installation.
export ZSH=/Users/eoghan/.oh-my-zsh

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
plugins=(git) 

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/eoghan/.fzf/bin"
export GIT_TEMPLATE_DIR=`overcommit --template-dir`
# export MANPATH="/usr/local/man:$MANPATH"


source $ZSH/oh-my-zsh.sh

# stop less being annoying
export LESS="-R -F -X"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

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
alias composer="php /usr/bin/composer.phar"
alias sport="cd ~/projects/work/thejournal-sports/"
alias infrastructure="cd ~/projects/work/thejournal-infrastructure/"
alias front="cd ~/projects/work/thejournal-front/"
alias journal="cd ~/projects/work/thejournal/"
alias playback="cd ~/projects/work/playback/"
alias ads="cd ~/projects/work/advertising/"
alias tmux="tmux -2"
alias api-vagrant="(cd ~/projects/work/thejournal-infrastructure/vagrant/api2-dev/ && vagrant reload)"
alias gdl="git diff --name-only HEAD HEAD^1"
alias vim-dirty='nvim `git status --porcelain | sed -ne "s/^ M //p"`'
alias vundle-install="nvim +PluginInstall +qall"
alias vundle-update="nvim +PluginUpdate +qall"
alias sudo='sudo ' # better sudo !!
alias vim='nvim'


# vimf - Open selected file in Vim with fzf and add to zsh_history
vimf() {
    FILE=$(fzf) && (echo -n ": "; echo -n $(date +%s); echo -n ":0;vim "; echo "$FILE") >> ~/.zsh_history && nvim "$FILE"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Load zsh-syntax-highlighting.
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh-autosuggestions.
#source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh
#
# Enable autosuggestions automatically.
#zle-line-init() {
#    zle autosuggest-start
#}
#zle -N zle-line-init
#AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=60'
#AUTOSUGGESTION_ACCEPT_RIGHT_ARROW=1

# ctrl-z to pause and resume vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
