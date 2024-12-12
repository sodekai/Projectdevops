# Use an official Ubuntu base image
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Go, Git, and other necessary utilities
RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    golang-go && \
    rm -rf /var/lib/apt/lists/*

# Set the Go workspace directory (optional but a good practice)
WORKDIR /app

# Clone your Go project from GitHub (replace with your repository URL)
RUN git clone https://gitlab.com/test1774137/projectdevops.git .

# Set Go environment variables (GOPATH and GOROOT are set automatically in the latest Go versions)
ENV GOPATH=/app/go
ENV GOROOT=/usr/lib/go

# Expose a port (optional, if needed for your application)
EXPOSE 8081

# Build your Go application (adjust according to your project's entry point)
RUN go run /projectdevops/webapi .

# Command to run the application (adjust with the name of your binary)
CMD ["./myapp"]
