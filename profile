##
# DELUXE-USR-LOCAL-BIN-INSERT
# (do not remove this comment)
##
echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ] ; then
    PATH=/usr/local/bin:$PATH
    export PATH
fi
echo $MANPATH | grep -q -s "/usr/local/man"
if [ $? -eq 1 ] ; then
    MANPATH=/usr/local/man:$MANPATH
    MANPATH=/usr/local/share/man:$MANPATH
    export MANPATH
fi
echo $PATH | grep -q -s "/usr/local/sbin"
if [ $? -eq 1 ] ; then
    PATH=$PATH:/usr/local/sbin
    export PATH
fi

# === PROMPT CUSTOMIZATION ===
# Mac default:
#export PS1=\h:\W \u\$

# Display git branch in shell prompt - __git_ps1 stored in git-completion.bash
#source ~/.bash_completion.d/git
#export PS1='\w$(__git_ps1 "(%s)") > '

# Via http://gist.github.com/31631
# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory

## Useful git status, disabled for performance on large repositories
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
#export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '

# Simple clean prompt via http://beckism.com/2009/02/better_bash_prompt/
export PS1='\[\e[1m\]________________________________________________________________________________\n \w$(parse_git_branch) @ \@ \d [!\!]\n => \[\e[0m\]'
export PS2="\[\e[1m\]| => \[\e[0m\]"

# === END PROMPT CUSTOMIZATION ===

# Colors
#export CLICOLOR=1
export TERM=xterm-color
#export LSCOLORS=gxfxcxdxbxegedabagacad  # cyan directories -- for dark/black background
#export LSCOLORS=ExFxCxDxBxEgEdabagacad   # ls defaults, with non-default fonts bolded
#export LSCOLORS=GxFxCxDxFxGgGdabagacad   # ls defaults, with non-default fonts bolded

export PATH=/usr/local/cuda/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH

export PATH=$HOME/bin:$PATH

alias o='open -a'
alias ttop='top -ocpu -R -F -s 2 -n30'

alias ll='ls -ltrF'
alias la='ls -AF'
alias l='ls -F'

alias make='make -j12'
alias m='make'
alias t='make test'
alias mt='m && t'

alias act='open -a "Activity Monitor"'

export EDITOR="mate -w"

alias spot='mdfind -onlyin `pwd`'

alias sshc='ker && ssh login.csail.mit.edu'
alias sshl='ssh luxosr.csail.mit.edu'

alias g=git

source ~/.profile.functions

# Amazon S3
#export AWS_ACCESS_KEY_ID=`get_keychain_service_account "Amazon S3"`
#export AWS_SECRET_ACCESS_KEY=`get_keychain_service_password "Amazon S3"`

alias updatedb='sudo nice /usr/libexec/locate.updatedb'

# Open a manpage in Preview, which can be saved to PDF
pman()
{
   man -t "${1}" | open -f -a /Applications/Preview.app
}

# don't put duplicate lines in the history. See bash(1) for more options
# export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
 
shopt -s histappend

# Bash doesn't have `rehash` -- this is the equivalent to rescan the PATH
alias rehash="hash -r"

# Record recurisve wget: 
alias wget-recursive="wget -r --no-parent"
alias rwget=wget-recursive
alias wgetr=wget-recursive

# Sublime Text
alias st='open -a "Sublime Text 2"'

# ARCHFLAGS, especially for Python extensions
export ARCHFLAGS='-arch x86_64 -arch i386'

#
# PROJECTS
#

export BUILD_PREFIX=`uname -s`-`uname -m`

# Orion/Terra
# export LUA_PATH="?.t;${HOME}/proj/fimage/Stanford-SEEC-Convolution-Engine/orion/?.t;${HOME}/proj/fimage/terra/tests/lib/?.t"
# export PATH=${PATH}:${HOME}/proj/fimage/terra

# Homebrew Cask: install globally
export HOMEBREW_CASK_OPTS="--appdir=/Applications"


# Adobe Perforce
export P4USER=jraganke
export P4PORT=ssl:yorktown.corp.adobe.com:7020
export P4CLIENT=jrkBookPro
