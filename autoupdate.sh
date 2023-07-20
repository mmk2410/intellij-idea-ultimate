#!/usr/bin/env bash

set -euo pipefail

dir="$(find . -maxdepth 1 -type d -name "intellij-idea-*")"
pushd "$dir" || exit 1

check="$(uscan --dehs --no-download)"
status="$(echo "$check" | xmllint --xpath 'string(/dehs/status)' -)"

if [[ "$status" != "newer package available" ]]; then
    echo "No newer package available."
    exit
fi

new_version="$(echo "$check" | xmllint --xpath 'string(/dehs/upstream-version)' -)"

popd

./update-new-version.sh --autoupdate "$new_version"
