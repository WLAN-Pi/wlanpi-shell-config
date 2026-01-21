# ~/.bash_aliases

export EDITOR=vim
export VISUAL=vim

# Color support for common commands
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enhanced ls aliases
alias l='ls --color=auto -F'
alias ls='ls --color=auto -F'
alias ll='ls -lh --color=auto --group-directories-first'
alias la='ls -A --color=auto -F'
alias lt='ls -lht --color=auto'
alias lS='ls -lhS --color=auto'
alias lx='ls -l --color=auto -X'

# Less with better defaults
alias lless='less -RFX'

# Sudo alias pass-through (allows aliases to work with sudo)
alias sudo='sudo '

# Raspberry Pi specific
alias temps='vcgencmd measure_temp && vcgencmd measure_volts'

# System monitoring
alias journal='journalctl -f'
alias running='systemctl list-units --type=service --state=running'
alias boot='systemctl list-unit-files --state=enabled'
alias failed='systemctl --failed'
alias zombies='ps aux | grep Z'
alias kernellogs='journalctl -k --since "1 hour ago"'

# File operations
alias secure-delete='shred -zvu -n 7'
alias mkdir='mkdir -pv'

# Path and time shortcuts
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias today='date +"%Y-%m-%d"'
alias clock='date +"%Y-%m-%d %T"'

# Network tools (modern ss instead of deprecated netstat)
alias ports='ss -tulanp'
alias connections='ss -nat | grep ESTAB | wc -l'
alias dnsinfo='cat /etc/resolv.conf'
alias ssh-forget='ssh-keygen -R'
alias listening='sudo lsof -i -n | grep -E "LISTEN|ESTABLISHED"'

# Process management
alias proctree='pstree -p'
alias openfiles='lsof | wc -l'
alias services='systemctl list-unit-files --type=service'

# Tmux utilities
alias tmux-save='tmux capture-pane -pJ -S- > ~/tmux-output-$(date +%Y%m%d-%H%M%S).log'

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
