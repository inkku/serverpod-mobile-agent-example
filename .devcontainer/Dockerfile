FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04
RUN apt-get update && apt-get install -y --no-install-recommends curl git unzip xz-utils zip libglu1-mesa libssl-dev libpq-dev && rm -rf /var/lib/apt/lists/*
RUN git clone --depth 1 --branch 3.44.4 https://github.com/flutter/flutter.git /opt/flutter && chown -R vscode:vscode /opt/flutter
ENV PATH="/opt/flutter/bin:${PATH}"
USER vscode
RUN flutter precache --web
