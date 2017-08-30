#!/bin/bash
function main {
    local old=$1
    local new=$2
    local now=`date -R`
    local author=`git config --get user.name`
    local email=`git config --get user.email`
    local username=`git config --get remote.origin.url | sed 's,.*:\(.*\)/.*,\1,'`
    local tempfile=`tempfile`

    git checkout -b version-$new

    mv intellij-idea-ultimate_{$old,$new}
    mv intellij-idea-ultimate_{$old,$new}.orig.tar.gz

    echo "intellij-idea-ultimate ($new-1) artful; urgency=low

  * Upstream Version $new

 -- $author ($username) <$email>  $now
 " >> $tempfile

    cat intellij-idea-ultimate_$new/debian/changelog >> $tempfile
    mv $tempfile intellij-idea-ultimate_$new/debian/changelog

    sed -i "s/$old/$new/g" intellij-idea-ultimate_$new/debian/preinst

    (cd intellij-idea-ultimate_$new/ && debuild -us -uc )

    rm intellij-idea-ultimate_${old}*

    sudo dpkg -i intellij-idea-ultimate_$new-1_all.deb
}



main $1 $2
