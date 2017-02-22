export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export EDITOR='vim'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Setting PATH for MAMP MySQL
export PATH=$PATH:/Applications/MAMP/Library/bin

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Editor
export EDITOR='nvim'

# Enable tab completion
source ~/git-completion.bash

# colors!
green="\[\033[0;32m\]"
yellow="\[\033[0;33m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
#export TERM=xterm-256color
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$green\u\$(__git_ps1) \W $ $reset"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
export PATH="$(brew --prefix homebrew/php/php55)/sbin:$PATH"
export PATH="$(brew --prefix homebrew/php/php55)/sbin:$PATH"
export PATH="$(brew --prefix homebrew/php/php55)/sbin:$PATH"

alias irssi='TERM=screen-256color irssi'

# # Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-material.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

source ~/.bin/tmuxinator.bash
