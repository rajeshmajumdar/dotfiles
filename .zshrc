
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use Vi, not Emacs, style editing
set editing-mode vi

# Show all completions as soon as I press tab, even if there's more than one.
set show-all-if-ambigious on

# Ignore case
set completion-ignore-case on

# on-menu-complete, first display the common prefix, then cycle through the
# options when hitting TAB
set menu-complete-display-prefix on

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export NODE_PATH='/usr/local/lib/node_modules'
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git vi-mode zsh-autosuggestions brew)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cls="clear"
alias py="python3"
alias vim="/usr/local/bin/vim"
source /Users/s/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias gita="git add ."
alias giti="git init"
alias gitc="git commit -a"
alias gitp="git push origin HEAD:main"
alias gits="git status"
alias t="tmux"
alias e="exit"
alias tn="tmux new -s"
alias ta="tmux attach-session -t"
alias calc="py /Users/s/Desktop/Projects/CLIs/calculator/calc.py"
alias new="py /Users/s/Desktop/Projects/CLIs/journal/main.py"
alias screen="/Users/s/Desktop/Projects/CLIs/screenipy/screenipy.run"
alias .="cd .."
alias cr="cargo run"
alias cn="cargo new"
alias ct="cargo test"
alias cc="cargo clean"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/s/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/s/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/s/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/s/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Ruby Environment Manager init
eval "$(rbenv init - zsh)"
