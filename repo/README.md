## Generate a Debian repo for Ceylon

You need to have a Debian-based machine (Ubuntu works) for this to work. This is based on 
https://wiki.debian.org/SettingUpSignedAptRepositoryWithReprepro

Install the reprepo package:

    $ sudo apt-get install reprepo

Make sure you have the private GPG key to be allowed to sign.

Now make the repo:

    $ ./build.sh

This will download any deb file for Ceylon unless already present in the current folder
and create a Debian repo in `dist` and `pool`.

### Alternate way to create `pool`

If you don't want to copy `pool` over the network and already have the deb files where you
want to deploy your repo, just run the `makepool.sh` script:

    $ ./makepool.sh *.deb

That will create a `pool` directory structure for you.
