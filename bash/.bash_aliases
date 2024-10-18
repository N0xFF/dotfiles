# Replace for "ls"
# Must be instaled first: https://github.com/eza-community/eza
if [ -x "$(command -v eza)" ]; then
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
fi

alias top='top -o cpu'

# Connect to host PG in WSL
if [ -n "$GUEST_IP" ]; then
  alias psql="psql --host=$GUEST_IP"
fi

# Start "queue_classic" worker
alias qc='QC_MEASURE=true DEBUG=true QUEUES="mailers,default" bundle exec rake qc:work'

# Find and kill all Spring Servers
alias kill-spring='for pid in $(ps -ef | awk "/spring/ {print \$2}"); do kill -9 $pid; done'

# Start Rails Server shortcut
function s {
  # Silently test a make target
  make --dry-run start &>/dev/null
  if [ $? -eq 0 ]; then
    DISABLE_SPRING=1 make start
  else
    DISABLE_SPRING=1 bundle exec rdbg -O -n -c -- bin/rails server
  fi
}

# Run Rails tests shortcut
function t {
  if [ -d "spec" ]; then
    local binstub="bin/rspec"
  else
    local binstub="bin/rails test -w --pride"
  fi

  bin/rake tmp:clear; bin/rails tmp:screenshots:clear; DISABLE_SPRING=1 eval $binstub ${@:1}
}

# Debug Rails tests
alias tt='HEADLESS=false INSPECTOR=true BACKTRACE=1 t'

# Open Rails console
function c {
  DISABLE_SPRING=1 bin/rails console
}
