# Option to disable anaconda
_INIT_CONDA=${INIT_CONDA:-true}

function conda_prompt_info(){
  [[ -n ${CONDA_DEFAULT_ENV} ]] || return
  echo "${ZSH_THEME_CONDA_ENV_PREFIX:=[}${CONDA_DEFAULT_ENV:t}${ZSH_THEME_CONDA_ENV_SUFFIX:=]}"
}

function init_conda() {
  _CONDA_ROOT=${CONDA_HOME:=$HOME/anaconda3}
  __conda_setup="$(${_CONDA_ROOT}/bin/conda 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "${_CONDA_ROOT}/etc/profile.d/conda.sh" ]; then
          . "${_CONDA_ROOT}/etc/profile.d/conda.sh"
      else
          export PATH="${_CONDA_ROOT}/bin:$PATH"
      fi
  fi
  unset __conda_setup
}

# Initialize conda
$_INIT_CONDA && init_conda
