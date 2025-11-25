if status is-interactive
    # INITS
    #
    starship init fish | source
    zoxide init --cmd cd fish | source
    fzf --fish | source
    
    # AUTOSTART TMUX
    #
    set fish_tmux_autostart false
end

set fish_greeting

# ALIASES
#
source ~/.bash_aliases

# SETS
#
set PATH $PATH /Users/filippaldo/.local/bin

# PYENV
#
pyenv init - fish | source

# EXPORTS
#
export LDFLAGS="-L$(brew --prefix openssl)/lib"
export CFLAGS="-I$(brew --prefix openssl)/include"
export SWIG_FEATURES="-I$(brew --prefix openssl)/include"
export PATH="$HOME/.docker/bin:$PATH"
