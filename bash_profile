source ~/.bashrc

# Prefix MacPorts on the path
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# -- start rip config -- #
RIPDIR=/Users/jrk/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #

# Setting PATH for MacPython 2.6
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
export PATH

export NARWHAL_ENGINE=jsc

export PATH="/usr/local/narwhal/bin:$PATH"
