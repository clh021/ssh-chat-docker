# Get ssh-chat latest bin
FROM alpine:latest
RUN apk update && \
    apk add curl jq
RUN curl -s https://api.github.com/repos/shazow/ssh-chat/releases/latest | jq -r '.assets[].browser_download_url' | grep "ssh-chat-linux_amd64.tgz" | xargs curl -L -o ssh-chat-linux_amd64.tgz
RUN tar xvfz ssh-chat-linux_amd64.tgz

# Build ssh-chat Docker Container
FROM alpine:latest
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN apk update && \
    apk add openssh-client
COPY --from=0 /ssh-chat/ssh-chat /ssh-chat
ENTRYPOINT ["/entrypoint.sh"]
