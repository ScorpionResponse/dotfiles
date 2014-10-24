# No emacs, never emacs
alias vi=vim
export EDITOR=vi

# If a non-zero return from a command, print it
export PROMPT_COMMAND='ret=$?; if [ $ret -ne 0 ] ; then echo -e "ret: \033[01;31m$ret\033[00;00m"; fi'

# Support local bash settings
if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

# Automatically start or attach to tmux
if [[ -z "$TMUX" ]]; then
    tmux has-session &> /dev/null
    if [ $? -eq 1 ]; then
      exec tmux new
      exit
    else
      exec tmux attach
      exit
    fi
fi
