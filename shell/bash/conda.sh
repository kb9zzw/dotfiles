# Look for conda in usual places
for usual_suspect in ~/anaconda3 /opt/anaconda3; do
  if command -v ${usual_suspect}/bin/conda &> /dev/null
  then
    export CONDA_HOME=${usual_suspect}
  fi
done


__conda_setup="$(${CONDA_HOME}/bin/conda 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${CONDA_HOME}/etc/profile.d/conda.sh" ]; then
        . "${CONDA_HOME}/etc/profile.d/conda.sh"
    else
        export PATH="${CONDA_HOME}/bin:$PATH"
    fi
fi
unset __conda_setup

