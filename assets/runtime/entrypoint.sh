#!/bin/bash

echo "Starting push proxy"
/opt/mattermost-push-proxy/bin/mattermost-push-proxy --config="/opt/mattermost-push-proxy/config/mattermost-push-proxy.json"