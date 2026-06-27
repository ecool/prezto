# Autosuggestions

Integrates the actively maintained [zsh-users/zsh-autosuggestions][1] into Prezto.
This provides Fish shell-style autosuggestions: as you type, Zsh shows
"ghost text" suggestions based on your command history and completions.

If this module is used in conjunction with the [`syntax-highlighting`](../syntax-highlighting#readme)
module, this module must be loaded **after** `syntax-highlighting`.

If you also use `history-substring-search`, load it **before** `autosuggestions`.

Recommended module load order:

```sh
zstyle ':prezto:load' pmodule \
  ...
  'syntax-highlighting' \
  'history-substring-search' \
  'autosuggestions' \
  ...
```

## Settings

### Highlighting

To enable color highlighting for suggestions:

```sh
zstyle ':prezto:module:autosuggestions' color 'yes'
```

To customize the highlight color (default is a subtle gray `fg=8`):

```sh
zstyle ':prezto:module:autosuggestions:color' found 'fg=cyan'
```

### Strategy

By default this module uses `history completion` (very Fish-like).
You can override it in your `.zpreztorc`:

```sh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# or: match_prev_cmd, etc.
```

## Key Bindings

- **Right Arrow** or **Ctrl+F**: Accept the full suggestion
- **Ctrl+Right** or **Alt+f**: Accept only the next word of the suggestion

## Troubleshooting

### Autosuggestions from previous sessions don't appear

Make sure the `history` module is also enabled in Prezto.

## Authors

*The authors of this module should be contacted via the issue tracker.*

- Original: [Sorin Ionescu](https://github.com/sorin-ionescu)
- Improvements in ecool/prezto fork

[1]: https://github.com/zsh-users/zsh-autosuggestions
