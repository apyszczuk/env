# env: My Environment Configuration

## What is inside

You can find here my configuration of applications that I use everyday.  Every
directory is responsible for configuring some application. You can install them
separately of course.

Since it is my environment configuration, not everything here will be suited
for you as it is, `git` or `package-list` are good examples of that. So, if you
want to try it make sure you have backup of your configuration and maybe read
configuration of that module first - it is always good to know what you can
expect.

## How to install

Open your terminal and change directory to your favourite location where you
want to store environment configuration and do the following:

```
$ git clone --recurse-submodules https://github.com/apyszczuk/env.git
```

In every directory inside `env` you will see `install.sh` script that does the
installation. Installation in most cases is just simply making symbolic link in
a specific location (where appropriate application will be searching for) to
configuration source directory or file from this repository.

To install any of the module, go to the directory and do as follows:

```
$ cd bash
$ sh install.sh
```

There is top level `env/install.sh` file that has logic of installing module.
It checks if target file exists and is either symbolic link, regular file or
directory.  Symbolic link is removed and new one is created. For latter two
error is produced.

## Screenshot

## License
Copyright © Artur Pyszczuk.
