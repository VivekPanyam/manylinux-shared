#!/bin/bash
set -eux

# Login to the registry
printenv GITHUB_TOKEN | docker login docker.pkg.github.com -u "$GITHUB_ACTOR" --password-stdin

# Get manylinux
git clone https://github.com/pypa/manylinux.git
pushd manylinux
git checkout 786a9319fae143b4f1ba065e2a9ffd2b71eea4c5
git apply ../enable_shared.patch

# Build the docker image
PLATFORM=x86_64 TRAVIS_COMMIT=latest ./build.sh
popd

# Tag and upload
# TODO: add versioned images
TARGET_IMAGE="docker.pkg.github.com/vivekpanyam/manylinux-shared/manylinux-shared:latest"
docker tag "quay.io/pypa/manylinux2010_x86_64" "$TARGET_IMAGE"
docker push "$TARGET_IMAGE"

