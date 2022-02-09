# ssh-chat docker

Docker image of [ssh-chat](https://github.com/shazow/ssh-chat) by [shazow](https://github.com/shazow).

# Usage

Generate keys outside of Docker to keep persistence, and not get warnings:

```
$ ssh-keygen -t rsa -b 4096 -N '' -f ./ssh-chat-key
```

Run the docker image:

```
$ docker run -p 2022:2022 -v /ssh-chat-key:/ssh_key leehom/ssh-chat:latest
```

You may supply additional arguments to the image, example:

```
$ docker run -p 22:22 -v /ssh-chat-key:/ssh_key leehom/ssh-chat:latest --bind ":22"
```

# Development

Improvements and ideas can be found on the projects issues section. 
