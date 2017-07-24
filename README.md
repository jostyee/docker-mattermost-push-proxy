# docker-mattermost-push-proxy
Dockerized [Mattermost Push Notifications Service](https://github.com/mattermost/mattermost-push-proxy)

## Run
    docker run --name mattermost-push-proxy -v `pwd`/config:/config jostyee/mattermost-push-proxy:3.10.0_alpine
