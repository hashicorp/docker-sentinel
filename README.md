# About this Repository

Sentinel is a language and framework for policy which is built to be embedded in existing software to enable fine-grained, logic-based policy decisions. Sentinel is an enterprise-only feature of HashiCorp Consul, Nomad, Terraform, and Vault.

This repo contains the docker configuration for the official Sentinel CLI image hosted on [HashiCorp's Docker Hub for Sentinel](https://hub.docker.com/r/hashicorp/sentinel/). The image is built using the latest Sentinel CLI binary that is made freely available on [https://releases.hashicorp.com](https://releases.hashicorp.com/).

If you wish to review all of the latest Sentinel runtime features and bug fixes, you can do so via the [Sentinel Runtime release notes](https://docs.hashicorp.com/sentinel/changelog).

## Getting Started

1.  Print the Sentinel runtime version

```shell
docker run -it \
    hashicorp/sentinel:latest \
    --version
```

2. Format Sentinel policy to a canonical format
```shell
docker run -it \
    --volume $(pwd):/app/ \
    --workdir /app/ \
    hashicorp/sentinel:latest \
    fmt -check=true $(find . -name "*.sentinel" -type f)
```

3. Test a policy within the working directory
```shell
docker run -it \
    --volume $(pwd):/app/ \
    --workdir /app/ \
    hashicorp/sentinel:latest \
    test
```

4. Recursively test a grouping of policies within the working directory
```shell
docker run -it \
    --volume $(pwd):/app/ \
    --workdir /app/ \
    hashicorp/sentinel:latest \
    test $(find . -name "*.sentinel" ! -path "*/testdata/*")
```
test
