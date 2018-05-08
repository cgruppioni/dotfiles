###########
# ALIASES #
###########
alias qq="cd . && source ~/.zshrc"
alias cp="cp -iv"
alias rm="rm -iv"
alias mv="mv -iv"
alias ls="ls -FGh"
alias du="du -cksh"
alias df="df -h"
# Use modern regexps for sed, i.e. "(one|two)", not "\(one\|two\)"
alias sed="sed -E"
# Just print request/response headers
alias curl-debug="command curl -vso /dev/null -H Fastly-debug:1"
alias curl="curl --verbose"
# Use modern regexps for grep, and do show color when `grep` is the final
# command, but don't when piping to something else, because the added color
# codes will mess up the expected input.
alias grep="egrep --color=auto"
# dup = "dotfiles update"
alias dup="pushd dotfiles && git checkout master && git pull && git checkout - && popd"
# Copy-pasting `$ python something.py` works
alias \$=''
alias diff="colordiff -u"
alias mkdir="\mkdir -p"
alias prettyjson="jq ."
alias prettyxml="xmllint --format -"
# Make images smaller
alias crush=/Applications/ImageOptim.app/Contents/MacOS/ImageOptim
alias o=open
# The `-g` flag means "global", and means that it can go anywhere in a command
# line and it will be preprocessed in, unlike "regular" aliases.
alias -g G="| grep "
alias -g ONE="| awk '{ print \$1}'"

run-until-succeeds(){ until "$@"; do; sleep 1; done }

# `-` by itself will act like `cd -`. Needs to be a function because `alias -`
# breaks.
function -() { cd - }

# Psh, "no nodename or servname not provided". I'll do `whois
# http://google.com/hello` if I want.
whois() {
  command whois $(echo "$1" | sed -E -e 's|^https?://||' -e 's|/.*$||g')
}

al() { ls -t | head -n ${1:-10}; }

# If piping something in, copy it.
# If just doing `clip`, paste it.
clip() { [ -t 0 ] && pbpaste || pbcopy;}


alias test='bin/rake test:system'
alias testfile='bin/rake test '
alias show_pids='lsof -wni tcp:3000'
alias kill_pid='kill -9 '
alias upstream='git pull upstream master --rebase'
alias h2o='cd ~/lil/h2o'
alias runh2o='cd ~/lil/h2o; guard'
export PATH="/usr/local/sbin:$PATH"
alias refresh='bundle install && bundle exec rake db:migrate && npm install'
alias -g poop=pop