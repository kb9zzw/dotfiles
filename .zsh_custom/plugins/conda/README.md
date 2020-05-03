# conda

The plugin sets up Anaconda and modifies the prompt.

To use it, add `conda` to the plugins array of your zshrc file:
```
plugins=(... conda)
```

The plugin creates a `conda_prompt_info` function that you can use in your theme, which displays
the basename of the current `$CONDA_DEFAULT_ENV`. It uses two variables to control how that is shown:

- `ZSH_THEME_CONDA_ENV_PREFIX`: sets the prefix of the VIRTUAL_ENV. Defaults to `[`.

- `ZSH_THEME_CONDA_ENV_SUFFIX`: sets the suffix of the VIRTUAL_ENV. Defaults to `]`.
-
-By default, the plugin will initialize Anaconda.  This may not be
always desired and can be disabled by setting `INIT_CONDA=false` in `.zshrc`.
