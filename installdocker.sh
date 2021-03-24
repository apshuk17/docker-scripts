#!/usr/bin/bash
# Install docker using curl
# Script is taken from get.docker.com

function installdockermachine {
        base=https://github.com/docker/machine/releases/download/v0.16.0 &&
        curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
        sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
        sudo chmod +x /usr/local/bin/docker-machine
}

function installdockercompose {
        sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
}

function installdocker {
        # Install docker engine
        curl -fsSL https://get.docker.com -o get-docker.sh
        sh get-docker.sh

        # Change group of user ubuntu to docker
        sudo usermod -aG docker ubuntu

        # Install docker machine
        installdockermachine

        # Install docker compose
        installdockercompose
}

installdocker
