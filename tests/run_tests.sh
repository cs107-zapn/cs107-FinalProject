#!/usr/bin/env bash

tests=(
    test_dualNumber.py
    test_overload.py
    test_optimizers.py)

# decide what driver to use (depending on arguments given)
unit='-m unittest'
if [[ $# -gt 0 && ${1} == 'coverage' ]]; then
    driver="${@} ${unit}"
elif [[ $# -gt 0 && ${1} == 'pytest'* ]]; then
    driver="${@}"
else
    driver="python ${@} ${unit}"
fi

# we must add the module source path because we use `import cs107_package` in our test suite and we
# want to test from the source directly (not a package that we have (possibly) installed earlier)
export PYTHONPATH="$(pwd -P)/../zapnAD":${PYTHONPATH}
# run the tests
${driver} ${tests[@]}
