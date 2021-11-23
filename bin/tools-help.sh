#!/usr/bin/env bash
. "$UTILS_BIN_PATH/boot-env.sh"

function launch() {
  if [ "$#" == 0 ]; then
    tools_help
  else
    HELP_TOOLS_SCRIPT_PATH="$UTILS_BIN_PATH/tools-$1.sh"
    if [ -e "$HELP_TOOLS_SCRIPT_PATH" ]; then
      # shellcheck disable=SC1090
      unset tools_help
      . "$HELP_TOOLS_SCRIPT_PATH"
      tools_help
    else
      err "未找到插件 $1,"
      exit 255
    fi

  fi
}
export SHORT_HELP="显示此帮助文档"

function tools_help() {
  out "帮助文档"
  out
  out "用法 ：tools [插件名称] [args...]"
  out
  cd "$UTILS_BIN_PATH" || exit
  for item in $(dir); do
    [[ -e "$item" ]] || continue
    [[ "$item" == tools-* ]] || continue
    # shellcheck disable=SC1090
    . "$UTILS_BIN_PATH/$item"
    COMMAND_NAME="$(echo "$item" | sed -e 's/\<tools-//g' -e 's/.sh//g')"
    out "- tools $COMMAND_NAME \t\t$SHORT_HELP"
  done
}
