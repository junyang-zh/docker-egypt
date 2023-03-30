# docker-egypt

Using [egypt](http://www.gson.org/egypt/) to generate call graph for Unix Makefile projects.

## Usage

Build the docker image:

```bash
docker build -t egypt .
```

Build the linux project:

```bash
git clone git@github.com:torvalds/linux.git
cd linux
make defconfig
make -j`nproc` KBUILD_CFLAGS=-fdump-rtl-expand
```

Use the docker image:

```bash
docker run -it -v `pwd`/linux:/mnt:rw -w /mnt egypt
```

Now you are inside docker with current working directory as `linux`. Generate the graph now:

```bash
egypt ./init/main.c.233r.expand | dot -Grankdir=LR -Tsvg -o callgraph.svg
```

The number before `.expand` extension may varies, keep an eye on it.
