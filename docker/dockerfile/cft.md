```sh
# alpine base lightweight
FROM debian:bullseye-slim

# Install dependencies & packages
RUN apt-get update && apt-get install -y curl dpkg git bash \
    && rm -rf /var/lib/apt/lists/*

# install Cloudflared
RUN curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb \
    && dpkg -i cloudflared.deb

# argo tunnel service + provided token
RUN cloudflared service install TOKEN_HERE

# cloudflared to run as the default command
CMD ["cloudflared", "tunnel", "--no-autoupdate", "run"]
