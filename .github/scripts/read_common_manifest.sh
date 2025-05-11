#!/usr/bin/env bash
#
# .github/scripts/read_manifest.sh
#
# Reads shared/common.yml, pulls out the `common:` list,
# and writes it into $GITHUB_OUTPUT as `common_folders=…`

set -euo pipefail

# run the Python snippet to output a comma-separated list
common=$(python3 << 'PY'
import yaml, sys
with open('shared/common.yml') as f:
    data = yaml.safe_load(f)
    lst = data.get('common', [])
print(','.join(lst))
PY
)

# emit to GitHub Actions
echo "common_folders=${common}" >> "$GITHUB_OUTPUT"
