# command aliases
alias l='ls -lhF'
alias la='ls -lhFa'

# diff for developers
alias mydiff='diff -u --show-c-function -s $1 $2'

# colorful prompt
HOST=$HOSTNAME # Change the name to your convenience

PS1="\[\033[0;37m\]\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]root@$HOST'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]$HOST'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]$ \[\033[0m\]"

# Screen session management
rescreen() {
  if [ "$TERM" = "screen" -o "$TERM" = "dumb" ]
  then
  #   echo "You are already working from a screen session"
     exit
  fi
  
  # Get screen sessions
  ATTACHED=`screen -ls | egrep "(Attached)" | awk '{print $1}'`
  DETACHED=`screen -ls | grep "(Detached)" | awk '{print $1}'`
  
  echo "Screen options:"
  echo
  
  echo "  0:  No screen"
  
  n=1
  for scrName in $ATTACHED
  do
     echo "  $n:  Attach to $scrName (open)"
     cmd[$n]="screen -DRR $scrName"
     n=`expr $n + 1`
  done
  
  for scrName in $DETACHED
  do
     echo "  $n:  Attach to $scrName"
     cmd[$n]="screen -r $scrName"
     n=`expr $n + 1`
  done
  
  echo "  $n:  Create a new session"
  echo
  
  # Read option
  option=""
  while [ -z "$option" ] || [ "$option" -lt "0" -o "$option" -gt "$n" ]
  do
     echo -n "> "
     read option
  done
  
  # No screen?
  if [ "$option" -eq "0" ]
  then return
  fi
  
  # New screen?
  if [ "$option" -eq "$n" ]
  then
     name=""
     while [ -z "$name" ]
     do
        echo -n "Give it a name: "
        read name
     done
     cmd[$n]="screen -S $name"
  fi
  
  # Run screen
  if [ ! -z "${cmd[$option]}" ]
  then ${cmd[$option]}
  fi
}

# Functions and utilities
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1       ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "The file '$1' does not have a known format" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# Enumerate all files up to an optional maximum depth
files(){
  if [ "$1" == "" ]
  then
    find -type f
  else
    find -maxdepth $1 -type f
  fi
}

# Enumerate all folders up to an optional maximum depth
folders(){
  if [ "$1" == "" ]
  then
    find -type d
  else
    find -maxdepth $1 -type d
  fi
}

# Pipe through awk to get a certain column
function fawk {
  first="awk '{print "
  last="}'"
  cmd="${first}\$${1}${last}"
  eval $cmd
}
