# intellij-idea-ultimate

Debian packages of IntelliJ IDEA Ultimate Edition for Ubuntu / Debian.

I also provide a package for the [Community Edition](https://gitlab.com/mmk2410/intellij-idea-community).

## Adding the PPA (on Ubuntu)

```
sudo apt-add-repository ppa:mmk2410/intellij-idea
sudo apt-get update
sudo apt-get install intellij-idea-ultimate
```

## Report issues

You can report issues, questions or feedback concerning the package [on GitLab](https://gitlab.com/mmk2410/intellij-idea-ultimate). If relevant, please include which version your using.

## Updating the package

The update process is nowadays completely automated. Therefore, I cannot  accept merge requests for updating the package to a new version. If there is any issue with the updating system, feel free to create an issue [on GitLab](https://gitlab.com/mmk2410/intellij-idea-ultimate).

### Setting up the build environment

Run `sudo apt install build-dep debhelper`.

It is also necessary to setup Git with your username and email address as explained in numerous tutorials.

### Updating the package

Run `./update-new-version.sh "$new-version"`

Where `$new-version` is in the format `[year].[major].[minor]`.
