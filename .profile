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

# Via http://gist.github.com/31631
# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory
 
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '

# === END PROMPT CUSTOMIZATION ===

# Colors
#export CLICOLOR=1
export TERM=xterm-color
#export LSCOLORS=gxfxcxdxbxegedabagacad  # cyan directories -- for dark/black background
#export LSCOLORS=ExFxCxDxBxEgEdabagacad   # ls defaults, with non-default fonts bolded
#export LSCOLORS=GxFxCxDxFxGgGdabagacad   # ls defaults, with non-default fonts bolded


export P4USER=jraganke
#P4PORT=perforce.lucasfilm.com:1666
export P4PORT=ors-avc-dev001.amr.corp.intel.com:1666
#P4CONFIG=/Users/jrk/.p4passwd
export P4CLIENT=jraganke-mobl3
export P4EDITOR=mate_wait
export P4DIFF=opendiff
#P4MERGE=merge
#P4ROOT=/Users/jrk/.p4root

export OSTYPE=$OSTYPE
#export CDPATH=.:~:~/Documents/Projects

export RMANTREE=/Applications/Pixar/RenderMan.app/Versions/RenderManProServer-14.3
export PATH=$PATH:$RMANTREE/bin
export PYTHONPATH=$PYTHONPATH:$RMANTREE/bin
export PATH=/usr/local/cuda/bin:$PATH

export OBJJ_HOME=/usr/local/share/objj
export STEAM_BUILD=/Users/jrk/objj_build

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/X11R6/bin

# DarwinPorts
export PATH=/opt/local/bin:${PATH}
export MANPATH=/opt/local/share/man:${MANPATH}
export INFOPATH=/opt/local/share/info:${INFOPATH}

export PATH=$HOME/bin:$PATH
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
alias aps='open -a "Adobe Photoshop CS4"'

alias snowcrash='ssh snowcrash.csres.utexas.edu'

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
export EDITOR="mate_w"
#export EDITOR=mate_w

#export DISPLAY=:0.0

export LC_CTYPE=en_US.UTF-8
export SCONSFLAGS=-Q

# ccache/distcc
#alias gcc='ccache gcc'
#alias g++='ccache g++'

#alias intelcc='source /opt/intel/cc/current/bin/iccvars.sh'

alias spot='mdfind -onlyin `pwd`'

# 6.863
#alias fst='java -cp automaton.jar:src rule2fst.Rule2FST'
#function dp {
#    OF=`mktemp /tmp/dot.XXX`
#    dot -Tpng -o${OF} $1
#    open -a Preview ${OF}
#}

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

#alias sshilm='ssh -Y jrkelley@millhouse.ilm.com'
alias sshk='ssh katokop1.mit.edu'
alias sshc='ker && ssh login.csail.mit.edu'

source ~/.profile.functions

# Amazon S3
export AWS_ACCESS_KEY_ID=`get_keychain_service_account "Amazon S3"`
export AWS_SECRET_ACCESS_KEY=`get_keychain_service_password "Amazon S3"`

alias updatedb='sudo nice /usr/libexec/locate.updatedb'


function mkdso {
  g++ -arch ppc -I${RMANTREE}/include -c $1 -o $1.o
  #setenv MACOSX_DEPLOYMENT_TARGET 10.3
  g++ -arch ppc -bundle -undefined dynamic_lookup $1.o -o $1.so
}


# Reset Visor size and kill/restart terminal, from:
# http://www.macosxhints.com/article.php?story=20070214223039729
resetvisor() {                                                                        
  defaults write com.apple.VTerminal VisorTerminal -dict-add Rows 20
  ~/bin/.visor &
  killall Terminal
}
# Alternatively, trap the EXIT point to always reset when quitting Terminal
trap "defaults write com.apple.VTerminal VisorTerminal -dict-add Rows 20" EXIT

DS_ROOT="/Users/jrk/Documents/Projects/multisampling/ds"
function v {
    if [[ $1 ]]; then
        DATA_ROOT="$DS_ROOT/data/$1"
        REF_IMG="$DATA_ROOT/*_raster.png"
        SIM_IMG="$DATA_ROOT/*sim.ppm"
    else
        REF_IMG="*_raster.png"
        SIM_IMG="*.sim.ppm"
    fi
    ll $REF_IMG $SIM_IMG
    imagediff $REF_IMG $SIM_IMG
}
#alias v='ll *_raster.png *sim.ppm && imagediff *_raster.png *sim.ppm' # verify
function t {
    RAST_FILE="$DS_ROOT/data/$1/$1.rast"
    python "$DS_ROOT/gpusim2/GPU.py" $RAST_FILE
}
function tv {
    t $1 && v $1
}
export PATH=$PATH:$DS_ROOT/util:$DS_ROOT/rasterizer