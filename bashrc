### Bash Configuration ###

# Check if running in interactive shell
[[ $- != *i* ]] && return

# Variables
alias ls='exa -l'
alias la='exa -la'
alias grep='grep --color=auto'

# Colors
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
NC="\[\033[0m\]"

# Icons
PROMPT_SYMBOL="➜" # Hoặc "❯", "$", ➤", "❯", "➜"

# Git
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt
export PS1="${GREEN}\u@\h${NC}:${BLUE}\w${YELLOW}\$(parse_git_branch)${NC} ${PROMPT_SYMBOL} "
