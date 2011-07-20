source ~/.bashrc

# -- start rip config -- #
RIPDIR=/Users/jrk/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #

export NARWHAL_ENGINE=jsc

export PATH="/usr/local/narwhal/bin:$PATH"

# -- start autojump config -- #
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi
# -- end autojump config -- #
