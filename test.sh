# A collection of badly written tests for clip.sh

echo "Running bodged unit tests..."

# Basic copy functionality
test_output="$(echo "the first[CTRL+C] Coding Challenge was [CTRL+V] string manipulation task" | ./clip.sh)"
[[ "${test_output}" == "the first Coding Challenge was the first string manipulation task" ]] && echo "[1] passed" || echo "[1] failed, actual: ${test_output}"

# No copy
test_output="$(echo "the first Coding Challenge was [CTRL+V] string manipulation task" | ./clip.sh)"
[[ "${test_output}" == "the first Coding Challenge was  string manipulation task" ]] && echo "[2] passed" || echo "[2] failed, actual: ${test_output}"

# Handles multiple copies and pastes
test_output="$(echo "the first[CTRL+C] Coding Challenge was [CTRL+V] string[CTRL+C] manipulation [CTRL+V] task" | ./clip.sh)"
[[ "${test_output}" == "the first Coding Challenge was the first string manipulation the first Coding Challenge was the first string task" ]] && echo "[3] passed" || echo "[3] failed, actual: ${test_output}"

# Basic cut functionality
test_output="$(echo "the first[CTRL+X] Coding Challenge was [CTRL+V] string manipulation task" | ./clip.sh)"
[[ "${test_output}" == " Coding Challenge was the first string manipulation task" ]] && echo "[4] passed" || echo "[4] failed, actual: ${test_output}"

# Handles multiple cut and pastes
test_output="$(echo "the first[CTRL+X] Coding Challenge was [CTRL+V] string[CTRL+X] manipulation [CTRL+V] task" | ./clip.sh)"
[[ "${test_output}" == " manipulation  Coding Challenge was the first string task" ]] && echo "[5] passed" || echo "[5] failed, actual: ${test_output}"

# Handles copies and cuts in the right order 1
test_output="$(echo "the first[CTRL+C] Coding Challenge was [CTRL+V] string[CTRL+X] manipulation [CTRL+V] task" | ./clip.sh)"
[[ "${test_output}" == " manipulation the first Coding Challenge was the first string task" ]] && echo "[6] passed" || echo "[6] failed, actual: ${test_output}"

# Handles copies and cuts in the right order 2
test_output="$(echo "the first[CTRL+X] Coding Challenge was [CTRL+V] string[CTRL+C] manipulation [CTRL+V] task" | ./clip.sh)"
[[ "${test_output}" == " Coding Challenge was the first string manipulation  Coding Challenge was the first string task" ]] && echo "[7] passed" || echo "[7] failed, actual: ${test_output}"
