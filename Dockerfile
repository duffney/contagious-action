FROM debian:12-slim

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG contagious_version

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && \
    apt-get install -y tar ca-certificates gnupg curl jq --no-install-recommends && \
    # Import Docker GPG key
    install -m 0755 -d /etc/apt/keyrings && \
    curl --retry 5 -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
    # Add the Docker repository with the correct key ID
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    # Install Docker
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli docker-buildx-plugin containerd.io --no-install-recommends

RUN curl --retry 5 -fsSL -o contagious.tar.gz https://github.com/duffney/contagious/releases/download/v${contagious_version}/contagious_${contagious_version}_linux_amd64.tar.gz && \
    tar -xzf contagious.tar.gz && \
    cp contagious /usr/local/bin/

ENTRYPOINT ["/entrypoint.sh"]
