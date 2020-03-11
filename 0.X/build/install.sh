set -eux && \
addgroup sentinel && \
adduser -S -G sentinel sentinel && \
apk add --no-cache ca-certificates curl gnupg openssl && \
gpg --keyserver pgp.mit.edu --recv-keys 91A6E7F85D05C65630BEF18951852D87348FFC4C && \
mkdir -p /tmp/build && \
cd /tmp/build && \
apkArch="$(apk --print-arch)" && \
case "${apkArch}" in \
    x86) sentinelArch='386' ;; \
    x86_64) sentinelArch='amd64' ;; \
    *) echo >&2 "error: unsupported architecture: ${apkArch} (see ${HASHICORP_RELEASES}/sentinel/${SENTINEL_VERSION}/)" && exit 1 ;; \
esac && \
wget ${HASHICORP_RELEASES}/sentinel/${SENTINEL_VERSION}/sentinel_${SENTINEL_VERSION}_linux_${sentinelArch}.zip && \
wget ${HASHICORP_RELEASES}/sentinel/${SENTINEL_VERSION}/sentinel_${SENTINEL_VERSION}_SHA256SUMS && \
wget ${HASHICORP_RELEASES}/sentinel/${SENTINEL_VERSION}/sentinel_${SENTINEL_VERSION}_SHA256SUMS.sig && \
gpg --batch --verify sentinel_${SENTINEL_VERSION}_SHA256SUMS.sig sentinel_${SENTINEL_VERSION}_SHA256SUMS && \
grep sentinel_${SENTINEL_VERSION}_linux_${sentinelArch}.zip sentinel_${SENTINEL_VERSION}_SHA256SUMS | sha256sum -c && \
unzip -d /bin sentinel_${SENTINEL_VERSION}_linux_${sentinelArch}.zip && \
cd /tmp && \
rm -rf /tmp/build && \
apk del gnupg openssl && \
rm -rf /root/.gnupg && \
sentinel version