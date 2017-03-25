# Aliases
alias l='ls -la'

# Auto-load ssh-agent
. $HOME/.config/fish/functions/ssh_agent_start.fish
start_agent

# direnv
eval (direnv hook fish)

# Enable Iterm2 Shell Integration
# https://www.iterm2.com/documentation-shell-integration.html
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# load rvm
rvm default
