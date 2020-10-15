The offical manylinux docker images are built with `--disable-shared`. In some cases, it's useful to have a version of these images built with `--enable-shared`.

This repo contains a small patch to the [official manylinux repo](https://github.com/pypa/manylinux) along with a build script and GitHub Actions workflow to build and push the image (only `manylinux2010_x86_64` for now).

_Note: the official repo does not do this for reasons specified at https://github.com/pypa/manylinux/pull/31 and https://github.com/pypa/manylinux/pull/32_
