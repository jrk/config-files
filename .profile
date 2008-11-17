# <Windows>

function explore {
    explorer $@ &
}

alias start='cmd /C start'

# </Windows>


# <SSH>

alias sshagent='eval `ssh-agent` && ssh-add'
alias ssha=sshagent

# </SSH>


# <Git>

# git-create-branch <branch_name>
# Creates and switches to a new *remote* branch (tracked locally) called <branch_name>
function git-create-branch {

    if [ $# -ne 1 ]; then
        echo 1>&2 Usage: $0 branch_name
        return 127
    fi

    branch_name=$1
    git push origin origin:refs/heads/${branch_name}
    git fetch origin
    git checkout --track -b ${branch_name} origin/${branch_name}
    git pull
}

# </Git>


# ART build
alias scons='python build/scons.py'

# (Via http://www.emacswiki.org/emacs/EmacsClient)
# To have emacsclient start a full Emacs process if it can’t connect to one, simply set ALTERNATE_EDITOR. In your .bash_profile (or similar):
export ALTERNATE_EDITOR=emacs EDITOR=emacsclient VISUAL=emacsclient

alias ed='emacsclient -n'