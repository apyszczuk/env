# env: Linux Environment Configuration


## Preface

You can find configuration of my whole Linux Environment here, meaning
configuration of applications that I use every day whose default configuration
was not satisfactory.  Every directory (module) has configuration of some
application. You can install them separately of course.

Since it is my Linux Environment configuration, not everything here will
be suited for you as it is, `git` or `package-list` are good examples of that.
So, if you want to try it, make sure you have backup of your configuration and
maybe read configuration of that module first - it is always good to know
beforehead what you are going to apply.


## How to install

Open your terminal and change directory to your favourite location where you
want to store environment configuration and do the following:

```
$ git clone --recurse-submodules https://github.com/apyszczuk/env.git
```

In every directory inside `env` you will see `install.sh` script that does the
installation. Installation in most cases is just simply making symbolic link
in a specific location (where application will be looking for) to
configuration source directory or file from this repository.

To install `bash` module, go to the directory and use `install.sh` script as
follows:

```
$ cd bash
$ sh install.sh
```

and now you can check if it worked by simply executing command:

```
$ ls -ld ~/.bashrc
```

if it points to the `bashrc` file from repository it means it worked.

There is top level `env/install.sh` file that has logic of installing module.
It checks if target file exists and if it is either symbolic link, regular
file or directory.  Symbolic link is removed and new one is created, but for
latter two error is produced.


## Modules

So far there is only one external module that is stored in this repository and
it is Vim configuration, but it is also mine. It uses external modules
(plugins) where some of them are mine and some of them are not.


## Branches

Configuration is developed in two branches in parallel. The main branch is
`master` which is used for my Arch Linux that I use at home. The other one
is `rh9-vdi` which is used for my Red Hat Enterprise Linux 9 workstation at
work.

I try my best to minimize difference between these two branches. Everytime
`master` gets something new, it is merged into `rh9-vdi` to get the same
experience at work.


## Screenshots

And now you can see how it looks like.

- Arch Linux

![env1](/env1.png)


- Red Hat Enterprise Linux 9

![env2](/env2.png)


## What is inside

- `i3`

    As you can see I do not use any fancy Desktop Environment, instead I
    prefer to use i3 Tiling Window Manager. I will not try to convince you
    to use it, but I am going to say that once you try it, you will never go
    back.

- `i3blocks`

    The status line on the bottom with some system information is controlled
    by i3blocks application and my simple scripts.

- `bash`

    It is my default shell. I have written some fancy functionalities for it
    with no external dependencies. Additionally there is configuration for
    dircolors and readline Linux utilities.

- `git`

    Just basic configuration of git.

- `package-list`

    List of packages installed on my system that is updated every time
    application is installed or removed.

- `picom`

    Used basically for making windows transparent with a slight shadow.

- `termite`

    Old and not used terminal emulator, left as backup to primary terminal
    emulator if something happens.

- `urxvt`

    Current terminal emulator.

- `vim`

    My Vim configuration that is still under development but I am pretty
    happy with it.

- `xinitrc`

    Initialize X server resources and start i3 Window Manager.

- `xresources`

    Resource file that includes other resource files.
