#!/bin/bash

# Exit on any error
set -e

# Output all commands
set -x

## Install required packages
apt-get update
apt-get install -y wget curl lib32gcc1 lib32stdc++6 unzip

## Setup directories
mkdir -p /tmp
mkdir -p /server/steam
cd /tmp

## Install SteamCMD
echo "Installing SteamCMD..."
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar -xzf steamcmd_linux.tar.gz -C /server/steam
rm steamcmd_linux.tar.gz

## Install the server using SteamCMD (replace APPID with the actual Draconia server app ID)
echo "Installing Draconia Server..."
APPID=1956500  # Replace with the actual Steam AppID for Draconia server

/server/steam/steamcmd.sh +force_install_dir /server +login anonymous +app_update $APPID validate +quit

## Create default configuration if it doesn't exist
cd /server
if [ ! -f config.yml ]; then
    echo "Creating default configuration file..."
    echo "server_name: ${SERVER_NAME:-Draconia Server}" > config.yml
    echo "server_port: ${SERVER_PORT:-25565}" >> config.yml
    echo "max_players: ${MAX_PLAYERS:-20}" >> config.yml
    echo "# Add more configuration options as needed" >> config.yml
fi

## Create start script
echo "#!/bin/bash" > /server/start.sh
echo "cd /server" >> /server/start.sh
echo "./DraconiaServer" >> /server/start.sh  # Replace with actual executable name
chmod +x /server/start.sh

## Create stop script
echo "#!/bin/bash" > /server/stop.sh
echo "pkill -f DraconiaServer" >> /server/stop.sh  # Replace with actual process name
chmod +x /server/stop.sh

echo "Installation complete!"