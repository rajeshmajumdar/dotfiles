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

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions brew)

function zvm_config() {
    ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
    ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
    ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
}

source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

ctags=/usr/local/bin/ctags

# zsh-syntax-highlighting
source /Users/s/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias lc="colorls -A"
alias cls="clear"
alias py="python3"
alias vim="/usr/local/bin/vim"
alias g="git"
alias t="tmux"
alias e="exit"
alias tn="tmux new -s"
alias ta="tmux attach-session -t"
alias calc="py /Users/s/Desktop/Projects/CLIs/calculator/calc.py"
alias new="py /Users/s/Desktop/Projects/CLIs/journal/main.py"
alias screen="/Users/s/Desktop/Projects/CLIs/screenipy/screenipy.run"
alias .="cd .."

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
