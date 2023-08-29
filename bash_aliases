# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias top='top -o cpu'

alias qc='QC_MEASURE=true DEBUG=true QUEUES="mailers,default" bundle exec rake qc:work'

alias kill-spring='for pid in $(ps -ef | awk "/spring/ {print \$2}"); do kill -9 $pid; done'

function s {
  DISABLE_SPRING=1 bin/rails server
}

function t {
  if [ -d "spec" ]; then
    local binstub="bin/rspec"
  else
    local binstub="bin/rails test -w --pride"
  fi

  bin/rake tmp:clear; bin/rails tmp:screenshots:clear; DISABLE_SPRING=1 $binstub ${@:1}
}

function c {
  DISABLE_SPRING=1 bin/rails console
}
