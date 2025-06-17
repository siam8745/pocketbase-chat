FROM alpine:3.17

WORKDIR /app

# Download PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v0.22.8/pocketbase_0.22.8_linux_amd64.zip .

# Unzip and cleanup
RUN apk add --no-cache unzip && \
    unzip pocketbase_0.22.8_linux_amd64.zip && \
    chmod +x pocketbase && \
    rm pocketbase_0.22.8_linux_amd64.zip

# Expose port
EXPOSE 8090

# Start PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
