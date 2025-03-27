# Draconia Server Egg for Pterodactyl

This project provides a server egg for Pterodactyl to easily install and manage a Draconia server.

## Files Included

- **egg-draconia.json**: Contains the configuration for the Draconia server egg, including metadata and Docker image details.
- **images/draconia.png**: An image asset for visual identification of the Draconia server in the Pterodactyl panel.
- **scripts/install.sh**: A shell script that automates the installation and setup of the Draconia server.

## Installation Instructions

1. **Upload the Egg**: Go to the Pterodactyl panel and navigate to the "Eggs" section. Upload the `egg-draconia.json` file.
2. **Create a Server**: After uploading, create a new server using the Draconia egg.
3. **Run the Installation Script**: The installation script will automatically run to set up the server. Ensure that your server has the necessary permissions to execute scripts.

## Configuration Options

- You can customize the server settings by modifying the configuration files located in the server's directory after installation.
- Refer to the Draconia documentation for specific configuration options available for the server.

## Troubleshooting Tips

- If you encounter issues during installation, check the logs for any error messages.
- Ensure that your server meets the minimum requirements for running a Draconia server.
- For further assistance, consult the community forums or the official Draconia support channels.