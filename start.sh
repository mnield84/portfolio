#!/bin/sh -ex

# Check if swapfile can be created and is needed
if [ ! -f /swapfile ] && [ "$(id -u)" = "0" ]; then
    fallocate -l 512M /swapfile && \
    chmod 0600 /swapfile && \
    mkswap /swapfile && \
    swapon /swapfile && \
    echo "Swap space configured."
fi

# Safely attempt to write to /proc/sys
echoSetting() {
    setting=$1
    value=$2
    if [ -w "$setting" ]; then
        echo "$value" > "$setting"
        echo "Set $setting to $value."
    else
        echo "Cannot modify $setting, read-only file system."
    fi
}

echoSetting /proc/sys/vm/swappiness 10
echoSetting /proc/sys/vm/overcommit_memory 1

# Run Prisma migrations
npx prisma migrate deploy

# Start the application
npm run start
