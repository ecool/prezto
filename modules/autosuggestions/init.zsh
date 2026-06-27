#
# Integrates zsh-autosuggestions into Prezto.
#
# This module uses the actively maintained zsh-users/zsh-autosuggestions
# for Fish-like autosuggestions (gray ghost text as you type).
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Updated in ecool/prezto fork for better defaults

# Load dependencies.
pmodload 'editor'

# Source the autosuggestions plugin.
source "${0:h}/external/zsh-autosuggestions.zsh" || return 1

#
# Fish-like defaults
#

# Strategy: prefer history matches, then fall back to completions
# This gives a very Fish-like experience.
: ${ZSH_AUTOSUGGEST_STRATEGY:=history completion}

# Subtle gray highlight by default (very common Fish look)
: ${ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE:=fg=8}

#
# Highlighting configuration via zstyle
#

# Allow user to override highlight style
zstyle -s ':prezto:module:autosuggestions:color' found \
  'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE' || true

# Disable highlighting if user explicitly turns it off
if ! zstyle -t ':prezto:module:autosuggestions' color; then
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=''
fi

#
# Key Bindings (Fish-like)
#

if [[ -n "$key_info" ]]; then
  # Accept suggestion (whole line) - Right Arrow or Ctrl+F
  bindkey -M viins "$key_info[Right]" autosuggest-accept
  bindkey -M viins "$key_info[Control]F" autosuggest-accept

  # Accept next word of suggestion (very useful)
  bindkey -M viins "$key_info[Control]Right" vi-forward-word
  bindkey -M viins "$key_info[Control]E" vi-add-eol
fi

# Also support emacs mode
bindkey '^F' autosuggest-accept
bindkey '^[f' vi-forward-word   # Alt+f to accept next word
