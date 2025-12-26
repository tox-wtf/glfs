<div align="center">
  <img src="https://github.com/glfs-book/glfs/blob/trunk/images/glfs-logo.png?raw=true" width="25%">
  <h1>GLFS</h1>
</div>

<h2 align="center">
Gaming Linux From Scratch
</h2>

This book covers the installation of graphics drivers, Steam, Wine, and more
following a Linux From Scratch install.

## Where to Read

Go to https://glfs-book.github.io/glfs/ and start going through the book!

The onlinle book is rolling release but there is a stable version in the GLFS
source via the `stable` branch.

You can switch to it by running the following command:
```Bash
git checkout stable
```

Then render the book by running the following command:
```Bash
make STAB=release
```

There are also [releases](https://github.com/glfs-book/glfs/releases) available
for download. These contain both the SysV and Systemd editions of the book as
chunked HTML.

## Installation

How do I convert these XML files to HTML myself? You need to have some software
installed that deal with these conversions. Please read
[INSTALL.md](./INSTALL.md) to determine which programs you need to install and
where to get instructions to install that software.

You can then build the HTML with a simple `make` command. You can change the
revision by passing `REV=<rev>` to the `make` command. `<rev>` can be:
- `sysv` (default)
- `systemd`

**Example:**
```Bash
make REV=systemd
```

You can switch the theme by passing `THEME=<theme>` to the `make` command.
`<theme>` can equal:
- `dark` (default)
- `light`
- any theme in `THEME_PATH`

**Example:**
```Bash
make THEME=dark
```

You can set the theme path by passing `THEME_PATH=<path>` to the `make` command.
The default is `stylesheets/lfs-xsl`. More themes are available at
https://github.com/glfs-book/lfs-themes.

**Example:**
```Bash
make THEME_PATH=../lfs-themes/themes THEME=whitepink
```

By default, `RENDERTMP`, which defaults to a temporary directory created by
`mktemp -d`, will be removed after every file has been converted to a new format
(e.g., HTML, wget-list, dumped commands, etc.). If you need to keep that
directory, pass `AUTO_CLEAN=0` to the `make` command.

**Example:**
```Bash
make RENDERTMP=~/tmp AUTO_CLEAN=0
```

> [!NOTE]
> Other variables exist. For a more comprehensive list of them, run `make help`,
> and for a complete list, inspect the Makefile.

The default values for the variables in the Makefile may be changed by declaring
them in `local.mk`. For instance, if `local.mk` contains `REV=systemd` and
`THEME=light`, calling `make` with no arguments will build the systemd revision
with the light theme. `local.mk` is not tracked and must be created manually.

The default target builds the SysV revision as chunked HTML in
`~/public_html/glfs`, whereas for Systemd, it would be in
`~/public_html/glfs-systemd`. By default, each package and section will be built
as its own page, then linked together.
