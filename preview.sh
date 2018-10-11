#!/bin/sh

if [ "$(uname)" == "Darwin" ]; then
    # Running on macOS.
    # Let's assume that the user has the Docker CE installed
    # which doesn't require a root password.
    echo "The preview will be available at http://localhost:8080/"
    docker run --rm -v $(pwd):/antora:ro -v $(pwd)/nginx.conf:/etc/nginx/conf.d/default.conf:ro -p 8080:80 nginx

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Running on Linux.
    # Check whether podman is available, else faill back to docker
    # which requires root.
    if [ -f /usr/bin/podman ]; then
        runtime="podman"
    else
	runtime="docker"
    fi
    if groups | grep -wq "docker"; then
        # Check if the current user is in the "docker" group. If true, no sudo is needed.
        echo ""
        echo "This build script is using $runtime to run the build in an isolated environment."
        echo "The preview will be available at http://localhost:8080/"
        echo ""
        $runtime run --rm -v $(pwd):/antora:ro,z -v $(pwd)/nginx.conf:/etc/nginx/conf.d/default.conf:ro,z -p 8080:80 nginx
    else
        # User isn't in the docker group; run the command with sudo.
        echo ""
        echo "This build script is using $runtime to run the build in an isolated environment. You might be asked for your password."
        echo "You can avoid this by adding your user to the 'docker' group, but be aware of the security implications. See https://docs.docker.com/install/linux/linux-postinstall/."
        echo ""
        echo "The preview will be available at http://localhost:8080/"
        echo ""
        sudo $runtime run --rm -v $(pwd):/antora:ro,z -v $(pwd)/nginx.conf:/etc/nginx/conf.d/default.conf:ro,z -p 8080:80 nginx
    fi
fi
