# --- Env / tools ---
eval "$($HOME/.local/bin/mise activate zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# ruby
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Go
export GOROOT=$(mise where go)
export PATH=$GOROOT/bin:$PATH

export EDITOR='nvim'
export MISE_ENV_FILE=.env

# --- Completion system ---
autoload -Uz compinit
# -C skips security check (faster startup if you trust your machine)
# remove -C if you want zsh to warn about insecure $fpath perms
compinit -C

# Completion tuning (mimics oh-my-zsh defaults)
zstyle ':completion:*' matcher-list \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' \
    'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{yellow}%B%d%b%f'
zstyle ':completion:*:messages' format '%F{magenta}%d%f'
zstyle ':completion:*:warnings' format '%F{red}no matches%f'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zcompcache

# --- Aliases ---
alias maildev:start="docker start maildev || docker run --name maildev -d -p 1080:1080 -p 1025:1025 maildev/maildev"
alias maildev:stop="docker stop maildev"
alias ansible-playbook='docker run --rm -v $(pwd):/mnt -v /etc/ansible:/etc/ansible -v ~/.ssh:/root/.ssh -v /tmp:/tmp -w /mnt alpine/ansible ansible-playbook'

alias pg:17:start='docker ps -a --filter "name=pg-17" --format "{{.Names}}" | grep -q "pg-17" || docker run -d --name pg-17 -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword postgres:17; docker start pg-17 2>/dev/null || true'
alias pg:17:stop='docker stop pg-17 2>/dev/null || true'

# Ruby aliases
alias bx="bundle exec"

# Rails aliases
alias r="./bin/rails"
alias rt="r test --defer-output"
alias rt:m="r test:models --defer-output"
alias rt:c="r test:controllers --defer-output"
alias rt:s="r test:system --defer-output"
alias rt:all="r test:all --defer-output" 

# Rust aliases
alias cntr="cargo nextest run"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
