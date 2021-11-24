#!/usr/bin/env bash

function launch() {
  if [ "$#" == 0 ]; then
    tools_help
  else
    PLUGIN_PATH="$TOOLS_PLUGIN_PATH/$1"
    PLUGIN_INFO_PATH="$PLUGIN_PATH/plugin-info.sh"
    if [ -e "$PLUGIN_INFO_PATH" ]; then
      unset tools_help
      # shellcheck disable=SC1090
      . "$PLUGIN_INFO_PATH"
      # shellcheck disable=SC1090
      if [ "$PLUGIN_ENV_SCRIPT" ] && [ -e "$PLUGIN_PATH/$PLUGIN_ENV_SCRIPT" ]; then
        . "$PLUGIN_PATH/$PLUGIN_ENV_SCRIPT"
      fi
      # shellcheck disable=SC1090
      . "$PLUGIN_PATH/$PLUGIN_BOOT_SCRIPT"
      out "插件 $1 ($PLUGIN_NAME) 帮助"
      out
      tools_help
    else
      err "未找到插件 $1."
      exit 255
    fi

  fi
}

function tools_help() {
  out "帮助文档"
  out
  out "用法 ：tools [插件名称] [args...]"
  out
  cd "$TOOLS_PLUGIN_PATH" || exit
  # shellcheck disable=SC2035
  PLUGINS="$(ls --directory *)"
  out "例如:"
  for item in $PLUGINS; do
    PLUGIN_PATH="$TOOLS_PLUGIN_PATH/$item"
    PLUGIN_INFO_PATH="$PLUGIN_PATH/plugin-info.sh"
    [[ -e "$PLUGIN_INFO_PATH" ]] || continue
    unset PLUGIN_SHORT_HELP
    # shellcheck disable=SC1090
    . "${PLUGIN_INFO_PATH}"
    if [ ! "$PLUGIN_SHORT_HELP" ]; then
      PLUGIN_SHORT_HELP="没有介绍"
    fi
    out " $(printf "%-6s %-10s %-10s" "- tools" "$item" "$PLUGIN_SHORT_HELP") "
  done
  out
  out "你可以使用 \" tools help [插件名称] \" 来查看插件的详细用法"
  out
}
