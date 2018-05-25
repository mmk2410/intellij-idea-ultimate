# intellij-idea-ultimate
.deb Packages of IntelliJ IDEA Ultimate Edition for Ubuntu / Debian

The latest upstream version is 2018.1.4 which is included in the package version 2018.1.4

## Adding the PPA

```
sudo apt-add-repository ppa:mmk2410/intellij-idea
sudo apt-get update
sudo apt-get install intellij-idea-ultimate
```

## Report issues

You can report issues, questions or feedback here on GitLab. Please include which version your using.

## Updating the package

To update the version follow the following steps (the old version is here 15.0.1 and the new one 15.0.2):

 1. Fork the repo
 2. Create your own feature branch

 ```
 git checkout -b version_15.0.2
 ```

 3. Rename the following

 ```
 mv intellij-idea-ultimate_15.0.1 intellij-idea-ultimate_15.0.2
 mv intellij-idea-ultimate_15.0.1.orig.tar.gz intellij-idea-ultimate_15.0.2.orig.tar.gz
 ```

 4. Edit the README.md and update the version numbers

 5. Go into the build files directory

 ```
 cd intellij-idea-ultimate_15.0.2/debian
 ```

 6. Edit the changelog file and prepend a new changelog entry. You can just copy an old one and update the values in it

 7. Edit the preinst file and update the download URL. Normally this is done by updating the version number

 8. Go one directory back

 ```
 cd ..
 ```

 9. Run the following command to build the package for testing purposes

 ```
 debuild -us -uc
 ```

 10. Go another directory back

 ```
 cd ..
 ```

 11. Remove the old files

 ```
 rm intellij-idea-ultimate_15.0.1-1*
 ```

 12. Install the package to test it

 ```
 sudo dpkg -i intellij-idea-ultimate_15.0.2-1_all.deb
 ```

 13. If everything works, add yourself to the CONTRIBUTORS.txt

 14. Commit your changes

 ```
 git add -A
 git commit -m "Version 15.0.2"
 ```

 15. Push to the branch

 ```
 git push origin version_15.0.2
 ```

 16. Create new pull request


### Setting up the build environment

Run `sudo apt install build-dep debhelper`.
