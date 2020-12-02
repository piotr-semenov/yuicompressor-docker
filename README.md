[![yuicompressor:2.4.8](https://img.shields.io/badge/yuicompressor-2.4.8-green.svg)](https://github.com/yui/yuicompressor/releases/tag/v2.4.8)
[![semenovp/tiny-yuicompressor:latest](https://img.shields.io/docker/image-size/semenovp/tiny-yuicompressor/latest)](https://hub.docker.com/r/semenovp/tiny-yuicompressor)
[![docker image size](https://img.shields.io/microbadger/layers/semenovp/tiny-yuicompressor/latest)](https://microbadger.com/images/semenovp/tiny-yuicompressor/)
[![docker pulls](https://img.shields.io/docker/pulls/semenovp/tiny-yuicompressor.svg)](https://hub.docker.com/r/semenovp/tiny-yuicompressor/)

# Usage
Just add the following alias to your .bashrc (or .bash_profile in OSX):

```bash
alias yuicompressor='docker run --rm -v `pwd`:/workdir -w /workdir semenovp/tiny-yuicompressor:latest'
```

It repeats the [original usage](https://yui.github.io/yuicompressor/index.html#using).

For example, do like this:

```bash
yuicompressor --type js -o output.js input.js

yuicompressor --type js -o output.css input.css
```

# How to build on your own?
```bash
docker build -t semenovp/tiny-yuicompressor:latest .
```

# List of `yuicompressor` images

Review the sizes of another `yuicompressor` images retrieved from [DockerHub](https://hub.docker.com) against current one built on OpenJDK v1.8.0_171.
Note, the original [openjdk:alpine](https://hub.docker.com/_/openjdk) is of 69.42Mb / 103Mb.

| REPOSITORY | YYYY-MM-DD | COMPRESSED / UNCOMPRESSED SIZE |
|:-----------|:----------:|:------------------------------:|
| **[semenovp/tiny-yuicompressor:latest](https://hub.docker.com/r/semenovp/tiny-yuicompressor/)** | 2020-12-02 | **47.38MB / 63.7MB** |
| [nullmem/yuicompressor:latest](https://hub.docker.com/r/nullmem/yuicompressor/) | 2020-02-05 | 55.08MB / 83.8MB |
| [lapsatech/yuicompressor:latest](https://hub.docker.com/r/lifeofguenter/yuicompressor/) | 2018-09-02 | 119.18MB / 312MB |
| [ruudk/yuicompressor:latest](https://hub.docker.com/r/ruudk/yuicompressor/) | 2014-05-12 |  157.73MB / 453MB|
| [fr3nd/yuicompressor:latest](https://hub.docker.com/r/fr3nd/yuicompressor/) | 2018-09-09 | 433.67MB / 891MB |
