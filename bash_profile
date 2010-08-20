source ~/.bashrc

# Prefix MacPorts on the path
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# -- start rip config -- #
RIPDIR=/Users/jrk/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #
