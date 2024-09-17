# ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'

# lists only directories (no files)
alias ld='eza -lD'
# lists only files (no directories)
alias lf='eza -lf --color=always | grep -v /'
# lists only hidden files (no directories)
alias lh='eza -dl .* --group-directories-first'
# lists everything with directories first
alias ll='eza -al --group-directories-first'
# lists only files sorted by size
# alias ls='eza -alf --color=always --sort=size | grep -v /'
# lists everything sorted by time updated
alias lt='eza -al --sort=modified'

alias top='top -o cpu'
alias psql="psql --host=$GUEST_IP"

alias qc='QC_MEASURE=true DEBUG=true QUEUES="mailers,default" bundle exec rake qc:work'

alias kill-spring='for pid in $(ps -ef | awk "/spring/ {print \$2}"); do kill -9 $pid; done'

alias tt='HEADLESS=false INSPECTOR=true BACKTRACE=1 t'

function s {
  DISABLE_SPRING=1 bundle exec rdbg -O -n -c -- bin/rails server
}

function t {
  if [ -d "spec" ]; then
    local binstub="bin/rspec"
  else
    local binstub="bin/rails test -w --pride"
  fi

  bin/rake tmp:clear; bin/rails tmp:screenshots:clear; DISABLE_SPRING=1 eval $binstub ${@:1}
}

function c {
  DISABLE_SPRING=1 bin/rails console
}
