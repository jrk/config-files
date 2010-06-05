# <Windows>

function explore {
    explorer $@ &
}

# Convert cygwin paths to windows paths
function cyg2win {
	# Dereferencing Cygwin links seems to be handled implicitly by cygpath -w
	#if [ -L "$1" ]; then
	#	1=`readlink -f "$1"` # dereference cygwin symlinks
	#fi
	cygpath -w "$1"      # return the fully resolved Windows path
}

alias start='cmd /C start'

function lnk {
	if [ -d "$1" ]; then
		ARGS="/D"
	else
		ARGS=""
	fi
	SRC=`cyg2win "$1"`
	DST=`cyg2win "$2"`
	cmd /C mklink ${ARGS} "$DST" "$SRC"
}

# </Windows>

# <SSH>

alias sshagent='eval `ssh-agent` && ssh-add'
alias ssha=sshagent

# ssh-agent setup via http://mah.everybody.org/docs/ssh
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi 

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
alias scons='/cygdrive/c/Python25/python.exe build/scons.py'
alias cdsrc='cd ~/src/jrk_research'
alias cdp4='cd ~/p4src/work_branches/ART/sw/jrk_research'

function runsample {
    pushd inst/samples/bin/windows-x64-lrb-netsim/debug/$1/
    ./host_$1.exe
    popd
}

# (Via http://www.emacswiki.org/emacs/EmacsClient)
# To have emacsclient start a full Emacs process if it can’t connect to one, simply set ALTERNATE_EDITOR. In your .bash_profile (or similar):
export ALTERNATE_EDITOR=emacs EDITOR=emacsclient #VISUAL=emacsclient
export VISUAL=sublimetext

alias ed='emacsclient -n'
alias em=ed

# Add msysGit and Sublime Text to our path
export PATH="${PATH}:/cygdrive/c/Program Files (x86)/Sublime Text" #":/cygdrive/c/Program Files (x86)/Git/bin"
alias st=sublimetext.exe
#export EDITOR=sublimetext.exe # already set in Windows user environment
