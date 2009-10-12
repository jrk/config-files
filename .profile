##
# DELUXE-USR-LOCAL-BIN-INSERT
# (do not remove this comment)
##
echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ] ; then
    PATH=$PATH:/usr/local/bin
    export PATH
fi


# === PROMPT CUSTOMIZATION ===
# Mac default:
#export PS1=\h:\W \u\$

# Display git branch in shell prompt - __git_ps1 stored in git-completion.bash
#source ~/.bash_completion.d/git
#export PS1='\w$(__git_ps1 "(%s)") > '


# Colors
#export CLICOLOR=1
export TERM=xterm-color
#export LSCOLORS=gxfxcxdxbxegedabagacad  # cyan directories -- for dark/black background
#export LSCOLORS=ExFxCxDxBxEgEdabagacad   # ls defaults, with non-default fonts bolded
#export LSCOLORS=GxFxCxDxFxGgGdabagacad   # ls defaults, with non-default fonts bolded


export OSTYPE=$OSTYPE
export CDPATH=.:~:~/Documents/Projects

export RMANTREE=/Applications/Pixar/RenderMan.app/Versions/RenderManProServer-13.0.3G4
export PATH=$PATH:$RMANTREE/bin
export PATH=/usr/local/cuda/bin:$PATH

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/X11R6/bin

# DarwinPorts
export PATH=/opt/local/bin:${PATH}
export MANPATH=/opt/local/share/man:${MANPATH}
export INFOPATH=/opt/local/share/info:${INFOPATH}

export PATH=$HOME/bin:$PATH
export PATH=.:${PATH}
export PATH=${PATH}:/Applications/Matlab/bin

export PATH=$PATH:/Developer/Tools

export JAVA_HOME=/Library/Java/Home

export CVS_RSH=ssh

alias o='open -a'
alias oqs='o Quicksilver'
alias reqs='killall Quicksilver && oqs'
alias ttop='top -ocpu -R -F -s 2 -n30'
alias see='open -a /Applications/SubEthaEdit.app'
alias ll='ls -ltrF'
alias la='ls -AF'
alias l='ls -F'
alias make='make -j4'
alias m='make'
#alias t='make test'
alias mft='make freshtest'
alias act='open -a "Activity Monitor"'
alias hexf='open -a "Hex Fiend"'
alias skim='open -a "Skim"'
alias s='skim'

#alias m='make -C ~/Projects/eclipse/workspace/lightspeed/src/compiler'
#alias xs='~/Projects/eclipse/workspace/lightspeed/export/xslc.exe'
#alias t='xs test.sl'
#alias tt='t; cat default.out.sl'
#alias tpd='t; shader -o in.slo test.sl; shader -o out.slo default.out.sl; diff in.slo out.slo'
#alias tqd='t; aqsl -o in.slx test.sl; aqsl -o out.slx default.out.sl; diff in.slx out.slx'
#alias td='tqd'

#alias ca='python ~/Projects/lightspeed/src/compiler/sslc/cachinganalysis_test.py'
#alias cgcg='python ~/Projects/lightspeed/src/compiler/sslc/cgcodegentest.py'
#alias slcg='python ~/Projects/lightspeed/src/compiler/sslc/rslcodegentest.py'
#alias t='cgcg test.sl'
#alias tt='t && cp test.cg luxotest/'
#alias tc='t && cat test.cg'
#alias tc='t && cgc -profile fp40 materialmain.cg'
#alias ttc='tt && cgc -profile fp40 materialmain.cg'

alias vu='myFlipper'

#export EDITOR='see -rw'
export EDITOR="mate -w"

#export DISPLAY=:0.0

export LC_CTYPE=en_US.UTF-8
export SCONSFLAGS=-Q

alias mt='m && t'

alias wcc='wc -l *.cpp *.h *.py *.rb'
alias am='open -a "Activity Monitor"'

#function qs {
#    if [ `/usr/bin/qs $@` = `true` ]; then
#        echo "Quicksilver is running...passing it along"
#    else
#        echo "Quicksilver not running...relaunching..."
#        oqs
#        #echo "and passing it along"
#        #/usr/bin/qs $@
#    fi
#}

alias sshk='ssh katokop1.mit.edu'
alias sshc='ker && ssh login.csail.mit.edu'

source ~/.profile.functions

alias updatedb='sudo nice /usr/libexec/locate.updatedb'

# Alternatively, trap the EXIT point to always reset when quitting Terminal
trap "defaults write com.apple.VTerminal VisorTerminal -dict-add Rows 20" EXIT