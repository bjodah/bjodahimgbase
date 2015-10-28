#!/bin/bash -xe
TAG=${1:-latest}
REGISTRY_USER=bjodah
DOCKERFILE_NAME=bjodahimgbase

absolute_repo_path_x="$(readlink -fn -- "$(dirname $0)/.."; echo x)"
absolute_repo_path="${absolute_repo_path_x%x}"
cd "$absolute_repo_path"/environment
docker build -t $REGISTRY_USER/$DOCKERFILE_NAME:$TAG . | tee ../$(basename $0).log && \
docker run --name bjodah-bjodahimgbase-tests -e TERM -v $absolute_repo_path/tests:/tests:ro $REGISTRY_USER/$DOCKERFILE_NAME:$TAG /tests/run_tests.sh
TEST_EXIT=$(docker wait bjodah-bjodahimgbase-tests)
docker rm bjodah-bjodahimgbase-tests
if [[ "$TEST_EXIT" != "0" ]]; then
    echo "Tests failed"
    exit 1
else
    echo "Tests passed"
    echo "You may now push your image:"
    echo "    $ docker push $REGISTRY_USER/$DOCKERFILE_NAME:$TAG"
fi
