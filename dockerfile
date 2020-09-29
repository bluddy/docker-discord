FROM ubuntu:18.04

RUN apt update && apt install golang-go
RUN go get github.com/42wim/matterbridge
WORKDIR "/go/bin"
COPY matterbridge.toml .
RUN cat "/run/secrets/docker_secret" >> matterbridge.toml
RUN /go/bin/matterbridge

