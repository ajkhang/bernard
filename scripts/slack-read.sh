#!/bin/bash
# Slack reading wrapper for Bernard
# Usage: slack-read.sh <channel-id> [limit]

export PATH=$PATH:/usr/sbin

CHANNEL=$1
LIMIT=${2:-50}

if [ -z "$CHANNEL" ]; then
    echo "Usage: slack-read.sh <channel-id-or-name> [message-limit]"
    echo "Example: slack-read.sh C04RSEUBMRP 20"
    exit 1
fi

slackdump dump "$CHANNEL" -limit "$LIMIT" 2>/dev/null
