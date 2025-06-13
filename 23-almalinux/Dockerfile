FROM tackleza/graalvm:23-almalinux

# ——— Install Node.js & Global TypeScript ———

RUN curl -fsSL https://rpm.nodesource.com/setup_22.x | bash - \
 && dnf install -y nodejs \
 && npm install -g typescript \
 && dnf clean all

# Verify Node.js & TypeScript
RUN node -v \
 && npm -v \
 && tsc -v

# Default command to run when the container starts
CMD ["bash"]
