#
# Integrates zsh-autosuggestions into Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
# The 'editor' module is required because autosuggestions uses some of its
# key binding infrastructure (key_info array).
pmodload 'editor'

# Source the autosuggestions plugin from the external directory.
# This is the core line that actually enables the Fish-style autosuggestions feature.
source "${0:h}/external/zsh-autosuggestions.zsh" || return 1

#
# Highlighting configuration
#

# Set the highlight color for the suggestion (ghost text).
# This zstyle allows users to customize the color via .zpreztorc if desired.
# Default is 'fg=8' (subtle gray) if not overridden.
zstyle -s ':prezto:module:autosuggestions:color' found \
  'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE' || ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Disable highlighting entirely if the user has set:
#   zstyle ':prezto:module:autosuggestions' color 'no'
if ! zstyle -t ':prezto:module:autosuggestions' color; then
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=''
fi

#
# Key bindings
#

# These bindings are needed so that users can accept the autosuggestion.
# Without them, there would be no easy way to accept the gray suggestion text.
if [[ -n "$key_info" ]]; then
  # Accept the full autosuggestion (equivalent to Right Arrow in many setups)
  bindkey -M viins "$key_info[Control]F" vi-forward-word
  bindkey -M viins "$key_info[Control]E" vi-add-eol
fi
