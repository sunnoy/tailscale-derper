FROM golang:latest AS builder
WORKDIR /app

# https://tailscale.com/kb/1118/custom-derp-servers/
RUN go install tailscale.com/cmd/derper@main

FROM ubuntu:latest
WORKDIR /


# Copy the derper binary
COPY --from=builder /go/bin/derper .