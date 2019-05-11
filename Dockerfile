FROM debian:latest

RUN apt-get update
RUN apt-get install -y curl jq
RUN curl -s https://api.github.com/repos/shazow/ssh-chat/releases/latest | jq -r '.assets[].browser_download_url' | grep "ssh-chat-linux_amd64.tgz" | xargs curl -L -o ssh-chat-linux_amd64.tgz
RUN tar xvfz ssh-chat-linux_amd64.tgz

FROM debian:latest

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN apt-get update && apt-get install openssh-client -y && apt-get clean

COPY --from=0 /ssh-chat/ssh-chat /ssh-chat

ENTRYPOINT ["/entrypoint.sh"]
