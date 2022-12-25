# topcom
Dockerfile for arm64 and amd64 builds of Topcom-0.17.8

First, please ensure that the docker engine is running.

1. Pull the image, as per the processor architecture (arm64 or amd64) of your device:

  `docker pull sudeepan/topcom:arm64`
  or,
  `docker pull sudeepan/topcom:amd64`

2. Run the image:

  `docker run -i sudeepan/topcom:arm64`
  or,
  `docker run -i sudeepan/topcom:amd64`

3. Change container name to "topcom":

  `docker rename <topcom-container-name> topcom`
