export PATH=${HOME}/bin/:${PATH}

## Useful git status, disabled for performance on large repositories
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# Mac default
#export PS1='\h:\W \u\$ '
# Simple clean prompt via http://beckism.com/2009/02/better_bash_prompt/
export PS1='\[\e[1m\]________________________________________________________________________________\n \w$(parse_git_branch) | \h @ \@ \d [!\!]\n => \[\e[0m\]'
export PS2="\[\e[1m\]| => \[\e[0m\]"
