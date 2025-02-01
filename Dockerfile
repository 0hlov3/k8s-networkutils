FROM alpine:3.21.2

LABEL MAINTAINER="0hlov3" \
      description="Container to Deploy into Kubernetes for Network debugging and testing."

ARG TARGETARCH
ARG KUBECTL_VERSION="v1.32.0"

ENV KUBECTL_ARCH=${TARGETARCH}

ARG APK_PACKAGES="bash \
                  bind-tools \
                  busybox-extras \
                  curl \
                  iputils \
                  iperf3 \
                  mtr \
                  netcat-openbsd \
                  nmap \
                  openssh-client \
                  tcpdump \
                  vim \
                  wget"

RUN apk --no-cache add --update $APK_PACKAGES && \
    # Download latest Kubectl
    ## curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    # Download versioned kubectl for the detected architecture
    curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/${KUBECTL_ARCH}/kubectl" && \
    curl -LO "https://dl.k8s.io/${KUBECTL_VERSION}/bin/linux/${KUBECTL_ARCH}/kubectl.sha256" && \
    echo "$(cat kubectl.sha256)  kubectl" | sha256sum -c && \
    chmod +x kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    rm -rf /var/cache/apk/*

CMD ["/bin/bash"]
