#!/bin/bash
set -euo pipefail

RC_FILE="$HOME/.bashrc"
LINE='export PATH=/usr/local/cuda/bin:$PATH'

# Ensure the rc file exists
touch "$RC_FILE"

# Append the line only if it's not already present
if ! grep -qxF "$LINE" "$RC_FILE"; then
  printf '\n%s\n' "$LINE" >> "$RC_FILE"
fi

# Source the updated rc file
# shellcheck source=/dev/null
source "$RC_FILE"