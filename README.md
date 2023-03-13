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

Since I automated the updating process quite a bit using the `update-new-version.sh` as well as preparations on my local system I no longer accept merge requests for updating the package to a new version. Processing them would take me much more time than doing the update myself.

In case I'm late for an update (over 1-2 weeks), feel free to create an issue [on GitLab](https://gitlab.com/mmk2410/intellij-idea-ultimate). I'm also working on a fully automated system for updating the packages but this will still take a while.

### Setting up the build environment

Run `sudo apt install build-dep debhelper`.

It is also necessary to setup Git with your username and email address as explained in numerous tutorials.

### Updating the package

Run `./update-new-version.sh "$new-version"`

Where `$new-version` is in the format `[year].[major].[minor]`.
