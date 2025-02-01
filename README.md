# k8s-networkutils

A lightweight Alpine-based container with essential network debugging tools for Kubernetes environments.

## Features
- **Comprehensive Network Toolkit**: `bind-tools`, `curl`, `iputils`, `iperf3`, `mtr`, `netcat`, `nmap`, `openssh-client`, `tcpdump`, `telnet`, `vim`, `wget`.
- **kubectl Pre-installed**: Comes with `kubectl` for interacting with Kubernetes directly.
- **Minimal & Efficient**: Built on Alpine Linux for small size and fast deployment.

## Use Cases
- Debugging network connectivity within Kubernetes clusters.
- Testing DNS resolution, TCP/UDP connectivity, and packet tracing.
- Running `kubectl` commands inside a lightweight container.


## How to Use
### Run as a Kubernetes Debugging Pod
```bash
kubectl run -it networkcheck --image=0hlov3/k8s-networkutils:latest -- /bin/bash
```

### Use as a Standalone Container
```bash
docker run --rm -it 0hlov3/k8s-networkutils:latest /bin/bash
```
or
```bash
podman run --rm -it 0hlov3/k8s-networkutils:latest /bin/bash
```

## Included Tools
- `bind-tools` - DNS utilities
- `curl` - Data transfer tool
- `iputils` - Network diagnostic tools (ping, tracepath, etc.)
- `iperf3` - Network bandwidth measurement tool
- `mtr` - Network diagnostic tool
- `netcat-openbsd` - TCP/UDP tool
- `nmap` - Network scanner
- `openssh-client` - SSH client
- `tcpdump` - Packet analyzer
- `telnet` - Network communication tool
- `vim` - Text editor
- `wget` - File downloader
- `kubectl` - Kubernetes command-line tool

## Build & Develop
### Build Locally
```sh
git clone https://github.com/0hlov3/k8s-networkutils.git
cd k8s-networkutils
```

```bash
podman manifest create docker.io/0hlov3/k8s-networkutils:${version}
podman build --platform linux/amd64,linux/arm64 --manifest docker.io/0hlov3/k8s-networkutils:${version} .
```

### Push to Docker Hub
```sh
podman manifest push docker.io/0hlov3/k8s-networkutils:${version}
podman tag docker.io/0hlov3/k8s-networkutils:${version} docker.io/0hlov3/k8s-networkutils:latest
podman manifest push docker.io/0hlov3/k8s-networkutils:latest
```

## Contributing
Contributions are welcome! Feel free to open an issue or submit a pull request on [GitHub](https://github.com/0hlov3/k8s-networkutils).

