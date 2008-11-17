# <Windows>

function explore {
    explorer $@ &
}

alias start='cmd /C start'

# </Windows>


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
