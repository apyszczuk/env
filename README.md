# env: My Environment

## What is inside


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

You need to know that this is MY environment configuration, so not everything
here will be suited for you, `git` or `package-list` are good examples for
that.

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
