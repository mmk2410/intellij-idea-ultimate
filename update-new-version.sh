#!/bin/bash
#
# This script intends to decrease the effort of updating the package.
#
# Passing "--autoupdate" as first argument triggers automatic Git operations.

set -euo pipefail

# Check if running Ubuntu
grep -q Ubuntu /etc/issue
if [[ $? != 0 ]]; then
    echo "System is not running Ubuntu. Cancelling build."
    exit 1
fi

PACKAGE="intellij-idea-ultimate"
DISTRIBUTION="lunar"

last_tag=$(git describe --abbrev=0 --tags)
old="${last_tag#?}"

if [ "$1" = "--autoupdate" ]; then
    new="$2"
    autoupdate="y"
else
    new="$1"
    autoupdate="n"
fi

name="$(git config --get user.name)"
email="$(git config --get user.email)"

git checkout -b version-"$new"

mv "$PACKAGE"_"$old" "$PACKAGE"_"$new"
mv "$PACKAGE"_"$old".orig.tar.gz "$PACKAGE"_"$new".orig.tar.gz

cd "$PACKAGE"_"$new" || exit

# Update the debian/changelog file with dch
NAME="$name" EMAIL="$email" dch \
    --newversion "$new"-1 \
    --distribution "$DISTRIBUTION" \
    "Upstream version $new"

sed -i "s/$old/$new/g" ./debian/preinst
sed -i "s/$old/$new/g" ./debian/postinst

debuild -us -uc

cd ..

rm "$PACKAGE"_"$old"-*

if [ "$autoupdate" = "n" ]; then
    exit
fi

git add -A
git commit -m "Upstream version $new"

git switch main
git merge --ff-only version-"$new"
git push origin main

git tag -a v"$new" -m "Upstream version $new"
git push --tags origin main
