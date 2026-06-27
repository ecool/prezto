#
# Integrates zsh-autosuggestions into Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
# The 'editor' module is required because autosuggestions uses some of its
# key binding infrastructure.
pmodload 'editor'

# Source the autosuggestions plugin.
# This line actually enables the autosuggestions feature.
source "${0:h}/external/zsh-autosuggestions.zsh" || return 1

#
# Highlighting configuration
#

# Allow users to customize the suggestion color via zstyle.
# Falls back to subtle gray (fg=8) if not set.
zstyle -s ':prezto:module:autosuggestions:color' found \
  'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE' || ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Respect user's choice to disable color highlighting.
if ! zstyle -t ':prezto:module:autosuggestions' color; then
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=''
fi

#
# Key bindings
#

# Ctrl + Right Arrow → Accept the full autosuggestion
bindkey '^[[1;5C' autosuggest-accept

# Ctrl + Alt + Right Arrow → Accept only the next word of the suggestion
# (very useful for granular control)
bindkey '^[[1;7C' vi-forward-word

# Fallback bindings (work in most environments)
bindkey '^F' autosuggest-accept          # Ctrl+F
bindkey '^[f' vi-forward-word            # Alt+f
