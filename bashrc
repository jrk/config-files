export PATH=/usr/local/bin:${PATH} # add Homebrew for even non-interactive logins

# If not running interactively, don't do anything
# [ -z "$PS1" ] && return
if [[ -n "$PS1" ]] ; then

  # ... original content that was below the '&& return' line ...

source ~/.profile

# bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

fi # <= be sure to close the if at the end of the .bashrc.
