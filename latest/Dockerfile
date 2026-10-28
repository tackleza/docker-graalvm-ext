FROM tackleza/graalvm:25-almalinux
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Reject an older published parent before installing additional tools.
COPY VerifyRuntime.java /tmp/VerifyRuntime.java
RUN java /tmp/VerifyRuntime.java && rm /tmp/VerifyRuntime.java
RUN dnf upgrade -y \
    && curl -fsSL https://rpm.nodesource.com/setup_24.x -o /tmp/setup-node.sh \
    && bash /tmp/setup-node.sh \
    && dnf install -y nodejs \
    && node -e 'const [major, minor, patch] = process.versions.node.split(".").map(Number); if (major !== 24 || minor < 22 || (minor === 22 && patch < 1)) throw new Error("Node 24.22.1 or newer in 24.x required")' \
    && npm install -g typescript \
    && rm /tmp/setup-node.sh \
    && dnf clean all
RUN node --version && npm --version && tsc --version
