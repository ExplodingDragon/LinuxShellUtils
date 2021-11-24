#!/usr/bin/env bash
function launch() {
  cd "$TOOLS_ROOT_PATH" || exit
    out "tools version"
    out
    out "app version:\t$(cat version.txt)"
    out "git version:\t$(git rev-parse HEAD)"
  cd "$TOOLS_WORK_PATH" >/dev/null 2>&1|| exit
}

function tools_help() {
  echo "显示此工具版本号"
}
