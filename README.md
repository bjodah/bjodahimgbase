# Personal Docker image useful for development

Based on Ubuntu 14.04 LTS. 

## How to build the image

Essentially you need to exectute the following steps:

```
$ ./tools/10_generate_Dockerfile.sh
$ ./tools/80_build_image.sh
```

If tests pass in the last step the Dockerfile is commited in git and
pushed to github which triggers a trusted build on [docker hub](
https://hub.docker.com/r/bjodah/bjodahimgbase).
