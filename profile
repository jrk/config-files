##
# DELUXE-USR-LOCAL-BIN-INSERT
# (do not remove this comment)
##
echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ] ; then
    PATH=$PATH:/usr/local/bin
    export PATH
fi

export PATH=/usr/local/git/bin:$PATH

# liftweb path vars
export M2_HOME=/opt/local/share/java/maven2/
export M2=$M2_HOME/bin
export MAVEN_OPTS="-noverify -javaagent:/Applications/liftweb-0.11/java-rebel/javarebel.jar"
export PATH=$M2:$PATH

export EMBER_PATH=/Users/jrk/Documents/Projects/ember/ember-p4
export EMBER_LLVM_BUILD_PATH=$EMBER_PATH/llvm-src/Release
export EMBER_LLVM_BIN_PATH=$EMBER_LLVM_BUILD_PATH/bin
export EMBER_LLVM_LIB_PATH=$EMBER_LLVM_BUILD_PATH/lib
#export PATH=$PATH:$EMBER_LLVM_BIN_PATH
alias emberopt="$EMBER_LLVM_BIN_PATH/opt -load $EMBER_LLVM_LIB_PATH/LLVMcd.dylib -load $EMBER_LLVM_LIB_PATH/LLVMember.dylib"
alias eopt=emberopt

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


export P4USER=jraganke
export P4EDITOR=mate_wait
export P4DIFF=opendiff
#P4MERGE=merge
#P4ROOT=/Users/jrk/.p4root

#export OSTYPE=$OSTYPE
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

#export JAVA_HOME=/Library/Java/Home
export FORTRESS_HOME=/Users/jrk/Projects/PFC
export PATH=${PATH}:${FORTRESS_HOME}/bin
alias ft=fortress

export CVS_RSH=ssh

alias o='open -a'
#alias oqs='o Quicksilver'
#alias reqs='killall Quicksilver && oqs'
alias oqs='o "Quick Search Box"'
alias reqs='killall "Quick Search Box" && oqs'
alias oqsb=oqs
alias reqsb=reqs
alias qsb=oqs
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

export EDITOR="mate_w"

export LC_CTYPE=en_US.UTF-8
export SCONSFLAGS=-Q

alias spot='mdfind -onlyin `pwd`'

alias mt='m && t'

alias wcc='wc -l *.cpp *.h *.py *.rb'
alias am='open -a "Activity Monitor"'

alias sshk='ssh katokop1.csail.mit.edu'
alias sshc='ker && ssh login.csail.mit.edu'
alias sshl='ssh luxo3.csail.mit.edu'

alias g=git

source ~/.profile.functions

# Amazon S3
export AWS_ACCESS_KEY_ID=`get_keychain_service_account "Amazon S3"`
export AWS_SECRET_ACCESS_KEY=`get_keychain_service_password "Amazon S3"`

alias updatedb='sudo nice /usr/libexec/locate.updatedb'


function mkdso {
  g++ -I${RMANTREE}/include -c $1 -o $1.o
  #setenv MACOSX_DEPLOYMENT_TARGET 10.3
  g++ -bundle -undefined dynamic_lookup $1.o -o $1.so
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

DS_ROOT="/Users/jrk/proj/multisampling/ds"
#export PATH=${PATH}:${DS_ROOT}/util
#source ${DS_ROOT}/util/profile

#function v {
#    if [[ $1 ]]; then
#        DATA_ROOT="$DS_ROOT/data/$1"
#        REF_IMG="$DATA_ROOT/*_raster.png"
#        SIM_IMG="$DATA_ROOT/*sim.ppm"
#    else
#        REF_IMG="*_raster.png"
#        SIM_IMG="*.sim.ppm"
#    fi
#    ll $REF_IMG $SIM_IMG
#    imagediff $REF_IMG $SIM_IMG
#}
#alias v='ll *_raster.png *sim.ppm && imagediff *_raster.png *sim.ppm' # verify
#function t {
#    RAST_FILE="$DS_ROOT/data/$1/$1.rast"
#    python "$DS_ROOT/gpusim2/GPU.py" $RAST_FILE
#}
#function tv {
#    t $1 && v $1
#}
#export PATH=$PATH:$DS_ROOT/util:$DS_ROOT/rasterizer

# Open a manpage in Preview, which can be saved to PDF
pman()
{
   man -t "${1}" | open -f -a /Applications/Preview.app
}

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
 
shopt -s histappend

# Add Scala
export SCALA_HOME=${HOME}/scala
export PATH=${PATH}:${SCALA_HOME}/bin

# Record recurisve wget: 
alias wget-recursive="wget -r --no-parent"
alias rwget=wget-recursive
alias wgetr=wget-recursive

# Go language
#export GOROOT=${HOME}/Projects/go
#export GOOS=darwin
#export GOARCH=amd64
#export GOBIN=${GOROOT}/bin
#export PATH=${PATH}:${GOBIN}
export GOROOT=`brew --prefix`/Cellar/go/HEAD
export GOARCH=amd64
export GOOS=darwin
export GOBIN=${GOROOT}/bin


# GitHub
#alias git=hub

# Haskell Cabal
export PATH=~/.cabal/bin:${PATH}

# Run R.app in the current working directory, as thought it were command-line R
alias Rapp="open -a R64 ."

# ooc
export OOC_HOME=${HOME}/Projects/ooc/ooc
export OOC_LIBS=/usr/local/lib/ooc
#export PATH=${PATH}:${HOME}/Projects/ooc/ooc/bin
# alias ooc='java -jar ${OOC_HOME}/ooc/bin/ooc.jar'

# ec2-api-tools
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home/"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-46266/"

# Google Chromium depot_tools
export PATH=${PATH}:/usr/local/Cellar/depot_tools/CURRENT