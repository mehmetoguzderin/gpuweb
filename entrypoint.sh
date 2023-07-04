#!/bin/bash -l
set -eo pipefail

cp -r /grammar ./wgsl/
export PATH="$(python3 -m site --user-base)/bin:${PATH}"
git init
git config --global --add safe.directory /github/workspace
BIKESHED_DISALLOW_ONLINE=1 REQUIRE_DIAGRAM_GENERATION=1 make -j out
bash tools/check-repo-clean.sh
