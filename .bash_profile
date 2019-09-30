export CLICOLOR=1
export EDITOR='subl'

## RVM integration ##
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=/usr/local/sbin:/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

## Colors ##
reset="\[\e[0m\]" ## Color reset
black="\[\e[0;30m\]"
grey="\[\e[1;30m\]"
silver="\[\e[0;37m\]"
white="\[\e[1;37m\]"
red="\[\e[0;31m\]"
pink="\[\e[1;31m\]"
green="\[\e[0;32m\]"
lime="\[\e[1;32m\]"
yellow="\[\e[0;33m\]"
lyellow="\[\e[1;33m\]"
navy="\[\e[0;34m\]"
blue="\[\e[1;34m\]"
purple="\[\e[0;35m\]"
lavender="\[\e[1;35m\]"
turquoise="\[\e[0;36m\]"
aqua="\[\e[1;36m\]"


## Prompt ##
path="$white\w$reset"
folder_name="$white\W$reset"
git_branch="\$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/$red(\1)$reset/')"
rvm="$green(\$(~/.rvm/bin/rvm-prompt i v p))$reset"

# Checks if working tree is dirty
function _git_st {
  if [[ $(git status 2> /dev/null | grep -i 'modified\|deleted\|new file\|untracked')  ]]; then
  	echo 'x'
  fi
}

PS1="$rvm $folder_name $git_branch $yellow\$(_git_st)$reset \$ "

## Global Aliases
alias ~='cd ~' # Short cut to get back to home directory 
pf () { # Open with pathfinder
  open -a "Path Finder.app" $(pwd);
}

## Select Specific Java Version
useJava () {
  if [ -z "$*" ];
    then
      JDK=6
    else
      JDK=$1
  fi
  export JAVA_HOME=`/usr/libexec/java_home -v 1.${JDK}*`
  echo `java -version`
}

## Use Safari JS engine in CLI
# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
# shellcheck disable=2139
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;

## ruby/project aliaeses
alias be='bundle exec'
# alias console='pry -r ./config/environment.rb'
# alias migrate='be rake db:migrate && be rake db:migrate RAILS_ENV=test'
# alias gs='SKIP_RUN_ALL=true be guard start'
# alias ttr='touch tmp/restart.txt'
# alias tldev='tail -f log/development.log'

## projects aliases
alias dev='cd ~/Projects'
alias dw='cd ~/Projects/Work'
alias dp='cd ~/Projects/Personal'

## GIT
alias g-rmd='git rm $(git ls-files --deleted)'
# alias g-pom='git pull origin master'
# alias g-pum='git push origin master'
# alias g-porc='git pull origin release_candidate'
# alias g-purc='git push origin release_candidate'
# alias g-master='git checkout master && git pull origin master'

## Apache/pow configs
# alias powup='curl get.pow.cx | sh'
# alias powdown='curl get.pow.cx/uninstall.sh | sh'
# alias switch_to_apache='powdown && sudo apachectl start'
# alias switch_to_pow='sudo apachectl stop && powup'

## ssh aliases
# alias staging='ssh somename'

## Android SDK aliases
# alias android='~/Developer/android/android-sdk-macosx/tools/android'
# alias android-mobi='emulator -avd wmx_mobile -partition-size 512'
# alias android-tablet='emulator -avd wmx_4.0 -partition-size 512'

##curl aliases
# alias get='curl -X GET -H "Content-Type:application/json"'
# alias post='curl -X POST -H "Content-Type:application/json" -d'
# alias put='curl -X PUT -H "Content-Type:application/json"-d'
# alias delete='curl -X DELETE -H "Content-Type:application/json"'
# alias options='curl -X OPTIONS -H "Content-Type:application/json"'

