#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
TARGET_DIR="$SCRIPT_DIR/target"
THEMES_DIR="${THEMES_DIR:-"$SCRIPT_DIR/../themes/themes"}"
RENDER_TMP="$(mktemp -d)"
cd "$SCRIPT_DIR"

cleanup() {
    rm -rf "$RENDER_TMP"
}

trap 'cleanup' EXIT INT HUP

make                                \
    REV=systemd                     \
    RENDERTMP="$RENDER_TMP"         \
    SHELL="/usr/bin/env bash"       \
    BASEDIR="$TARGET_DIR/book"      \
    DUMPDIR="$TARGET_DIR/commands"  \
    THEME_PATH="$THEMES_DIR"        \
    THEME="$THEME"                  \
    -j16
