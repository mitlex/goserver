FROM debian:stable-slim

# COPY source destination
COPY goserver /bin/goserver

# Sets PORT for the Go server to listen on inside the container.
# To reach it from the host, map a host port to this container port:
# docker run -p 8991:8991 goserver
ENV PORT=8991

# Automatically starts the server process in the container when we run it.
# This is default command when starting the container, but CMD can be overridden.
CMD ["/bin/goserver"]