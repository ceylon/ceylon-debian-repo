## Update the Debian files for the new release

### Minor release

You can open `rules` in an editor and check that the following three line contains the correct information:

```
VERSION=1.2.0
```

Update the versions used in `ceylon-*.prerm`:

```
VERSION=1.2.0
```

Update the versions used in `ceylon-*.postinst`:

```
VERSION=1.2.0
INSTALL_LINE="/usr/bin/ceylon ceylon /usr/share/ceylon/$VERSION/bin/ceylon 12000"
```

Add a changelog entry:

```
$ dch -i
```

### Major release

If you're doing a major release, you will need to do all the changes in the minor release 
as listed previously, and you may want to change the name of the package in `control`:

```
Source: ceylon-1.2.0
...
Package: ceylon-1.2.0
```

Also rename the following files to the new release name:

- `ceylon-1.2.0.prerm`
- `ceylon-1.2.0.postinst`

## How to build the DEB

This is going to be from scratch asuming a clean Debian/Ubuntu install.

First we're going to make sure we've got all the core development tools installed:

 - `sudo apt-get install dh-make fakeroot devscripts

Also make sure you've got "texinfo" installed:

 - `sudo apt-get install texinfo

**For the following commands make sure your current directory is where this README is.**

The next thing we need is the official distribution ZIP file, so either:

 - Download it from [the website](http://www.ceylon-lang.org/download/),
 - Create it [using Docker](https://hub.docker.com/r/ceylon/ceylon-build/) or
 - Build it following [these instructions](http://www.ceylon-lang.org/code/contribute/) but using `ant clean release`

And copy it to the current directory.

And finally we get to the point where we actually build the DEB package:

 - `./debian rules clean binary`

The result you'll be able to find in `../`!

Now your next step is to [build a Debian repo](../repo/README.md)

