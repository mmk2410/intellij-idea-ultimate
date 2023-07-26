#!/usr/bin/env bash

set -euo pipefail

dir="$(find . -maxdepth 1 -type d -name "intellij-idea-*")"
pushd "$dir" || exit 1

set +e
check="$(uscan --dehs --no-download)"
set -e

status="$(echo "$check" | xmllint --xpath 'string(/dehs/status)' -)"

if [[ "$status" != "newer package available" ]]; then
    echo "No newer package available."
    exit
fi

new_version="$(echo "$check" | xmllint --xpath 'string(/dehs/upstream-version)' -)"

popd

./update-new-version.sh "$new_version"

git add -A
git commit -m "Upstream version $new_version"

git switch main
git merge --ff-only version-"$new_version"
git push origin main

git tag -a v"$new_version" -m "Upstream version $new_version"
git push --tags origin main
