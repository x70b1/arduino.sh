# arduino.sh

Build code and upload it to an Arduino board using `arduino-cli`.

Use this script in existing projects to simplify development and deployment.


## build_vars.sh

An example for a full `build_vars.sh` file:

```
#!/bin/sh
# shellcheck disable=SC2034

SETUP_FQBN="arduino:megaavr:nona4809"
SETUP_CORE="arduino:megaavr"
SETUP_PORT=/dev/ttyACM0
SETUP_CONFIG=arduino-cli.yaml

PROJECT_TITLE="Title"
PROJECT_DESCRIPTION="Cool description."
PROJECT_URL="github.com/user/project"
PROJECT_BASE="https://store.arduino.cc/arduino-nano"
PROJECT_FIGLET="
 █████╗ ██████╗ ██████╗ ██╗   ██╗██╗███╗   ██╗ ██████╗     ███╗   ██╗ █████╗ ███╗   ██╗ ██████╗
██╔══██╗██╔══██╗██╔══██╗██║   ██║██║████╗  ██║██╔═══██╗    ████╗  ██║██╔══██╗████╗  ██║██╔═══██╗
███████║██████╔╝██║  ██║██║   ██║██║██╔██╗ ██║██║   ██║    ██╔██╗ ██║███████║██╔██╗ ██║██║   ██║
██╔══██║██╔══██╗██║  ██║██║   ██║██║██║╚██╗██║██║   ██║    ██║╚██╗██║██╔══██║██║╚██╗██║██║   ██║
██║  ██║██║  ██║██████╔╝╚██████╔╝██║██║ ╚████║╚██████╔╝    ██║ ╚████║██║  ██║██║ ╚████║╚██████╔╝
╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝
"
```
