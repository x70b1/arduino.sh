# arduino.sh

[![Actions](https://github.com/x70b1/arduino.sh/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/x70b1/arduino.sh/actions)
[![Contributors](https://img.shields.io/github/contributors/x70b1/arduino.sh.svg)](https://github.com/x70b1/arduino.sh/graphs/contributors)
[![License](https://img.shields.io/github/license/x70b1/arduino.sh.svg)](https://github.com/x70b1/arduino.sh/blob/master/LICENSE)

Build code and upload it to an Arduino board using `arduino-cli`.

Use this script in existing projects to simplify development and deployment.


## build_vars.sh

An example for a full `build_vars.sh` file:

```sh
#!/bin/sh
# shellcheck disable=SC2034

SETUP_FQBN="arduino:megaavr:nona4809"
SETUP_CORE="arduino:megaavr"
SETUP_PORT=/dev/ttyACM0

PROJECT_TITLE="Title"
PROJECT_DESCRIPTION="Cool description."
PROJECT_URL="github.com/user/project"
PROJECT_BASE="https://store.arduino.cc/arduino-nano"
```
