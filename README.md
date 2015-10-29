# Personal Docker image useful for development

Based on Ubuntu 14.04 LTS. Comes with GNU compiler collection (4.8),
LLVM 3.7 and build tools. See:

- [apt_packages.txt](environment/resources/apt_packages.txt)
- [apt_packages_llvm.txt](environment/resources/apt_packages_llvm.txt)


## How to build the image

Essentially you need to exectute the following steps:

```
$ ./tools/10_generate_Dockerfile.sh
$ ./tools/80_build_image.sh
```

If tests pass in the last step the Dockerfile is commited in git and
pushed to github which triggers a trusted build on [docker hub](
https://hub.docker.com/r/bjodah/bjodahimgbase).


## Uses of the image

Currently the image is used as a base (and build tool) for
[bjodahimg](https://github.com/bjodah/bjodahimg)
