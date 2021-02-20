#!/bin/sh
# shellcheck disable=SC1091

pre_check() {
    if ! command -v arduino-cli > /dev/null; then
        echo "arduini-cli not found!"
    fi

    if [ ! -f "./build_vars.sh" ]; then
        echo "build_vars.sh not found!"
    fi
}

run_usage() {
    printf "\\033[33m#  usage\\033[0m\\n"
    printf "   --build\\n        Download Arduino core sources, build and upload code.\\n\\n"
    printf "   --rebuild\\n        Build and upload code to Arduino board.\\n\\n"
    printf "   --info\\n        Print some info about arduino-cli version and connected boards.\\n\\n"
}

run_init() {
    printf "\\033[33m%s\\033[0m\\n" "$PROJECT_FIGLET"

    printf "\\033[33m#            %s\\033[0m\\n" "$PROJECT_TITLE"
    printf "\\033[33m#            %s\\033[0m\\n\\n" "$PROJECT_DESCRIPTION"

    printf "\\033[33m#  url:      %s\\033[0m\\n" "$PROJECT_URL"
    printf "\\033[33m#  base:     %s\\033[0m\\n\\n" "$PROJECT_BASE"
}

run_cli() {
    printf "\\033[33m#  cli\\033[0m\\n"
    arduino-cli version
}

run_config() {
    printf "\\n\\033[33m#  config\\033[0m\\n"
    arduino-cli --config-file "$SETUP_CONFIG" config dump
}

run_sources() {
    printf "\\033[33m#  sources\\033[0m\\n"
    arduino-cli --config-file "$SETUP_CONFIG" core update-index
    arduino-cli --config-file "$SETUP_CONFIG" core install "$SETUP_CORE"
}

run_boards() {
    printf "\\n\\033[33m#  boards\\033[0m\\n"
    arduino-cli --config-file "$SETUP_CONFIG" board list
}

run_build() {
    printf "\\n\\033[33m#  build\\033[0m\\n"

    if build=$(arduino-cli --config-file "$SETUP_CONFIG" compile --fqbn "$SETUP_FQBN" 2>&1); then
        echo "$build"
        printf "\\n\\033[33m#  upload to %s\\033[0m\\n" "$SETUP_PORT"

        if upload=$(arduino-cli --config-file "$SETUP_CONFIG" upload -p "$SETUP_PORT" --fqbn "$SETUP_FQBN" 2>&1); then
            echo "$upload"
            printf "\\n\\033[32m#  successfully uploaded\\033[0m\\n\\n"
        else
            echo "$upload"
            printf "\\n\\033[31m#  upload failed\\033[0m\\n\\n"
        fi
    else
        echo "$build"
        printf "\\n\\033[31m#  build failed\\033[0m\\n\\n"
    fi
}

if [ -f "build_vars.sh" ]; then
    . ./build_vars.sh
fi

requirements=$(pre_check)

if [ -z "$requirements" ]; then
    case "$1" in
        --info)
            run_init
            run_cli
            run_config
            run_boards
            ;;
        --rebuild)
            run_init
            run_build
            ;;
        --build)
            run_init
            run_cli
            run_config
            run_sources
            run_boards
            run_build
            ;;
        *)
            run_init
            run_usage
    esac
else
    echo "$requirements"
fi
