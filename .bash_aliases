alias lt='ls --human-readable --size -1 -S --classify'
alias mnt='mount | grep -E ^/dev | column -t'
alias search='find . -name $1'

function cn {
  echo "Loading $1"
  cd ~/workspace/"$1";
  workon "$1";
  source ~/workspace/"$1"/dev/env_develop
}

function co {
  deactivate;
  cd ~
}

function dstop {
  docker ps | fzf | awk '{print $1}' | xargs docker stop
}

function dstart {
  docker ps -f "status=exited" | fzf | awk '{print $1}' | xargs docker start
}

