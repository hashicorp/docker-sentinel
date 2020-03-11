# Sentinel Official Image Build

The version of this hosted on [HashiCorp's Docker Hub for Sentinel](https://hub.docker.com/r/hashicorp/sentinel/)
is built from the same source as the [Sentinel Official Image](https://hub.docker.com/_/sentinel/).

There are several pieces that are used to build this image:

* We start with an Alpine base image and add CA certificates in order to reach
  the HashiCorp releases server.
* Finally a specific Sentinel build is fetched and the rest of the Sentinel-specific
  configuration happens according to the Packer [build.json](0.X/build/build.json).
