#!/usr/bin/env bash
if [ "$LIB_CORE_LOAD" ]; then
  return
fi
LIB_CORE_LOAD="FINISH"
# 声明
include "output"
include "check"
include "log"

if [ "$#" = 0 ]; then
  # 参数错误
  err "未知参数, 你可使用 tools help 查看使用方法"
  exit 1
fi

PLUGIN_PATH="$TOOLS_PLUGIN_PATH/$1"
PLUGIN_INFO_PATH="$PLUGIN_PATH/plugin-info.sh"

debug "PLUGIN_PATH=$PLUGIN_PATH"
debug "PLUGIN_INFO_PATH=$PLUGIN_INFO_PATH"

# shellcheck disable=SC1090
if [ -e "$PLUGIN_INFO_PATH" ]; then

  . "${PLUGIN_INFO_PATH}" # 加载配置文件
  if [ "$PLUGIN_NAME" ]; then
    export TOOL_NAME="$PLUGIN_NAME"
  else
    export TOOL_NAME="$1"
    export PLUGIN_NAME="$1"
  fi
  PLUGIN_ENV_SCRIPT_PATH="$PLUGIN_PATH/$PLUGIN_ENV_SCRIPT"
  if [ -e "$PLUGIN_ENV_SCRIPT_PATH" ] && [ ! -d "$PLUGIN_ENV_SCRIPT_PATH" ]; then
    . "${PLUGIN_ENV_SCRIPT_PATH}" # 如果 env 存在则加载 env
  fi
  PLUGIN_BOOT_SCRIPT_PATH="$PLUGIN_PATH/$PLUGIN_BOOT_SCRIPT"

  if [ -e "$PLUGIN_BOOT_SCRIPT_PATH" ] && [ ! -d "$PLUGIN_BOOT_SCRIPT_PATH" ]; then
    . "${PLUGIN_BOOT_SCRIPT_PATH}"
  else
    error "插件内部错误！ PLUGIN_BOOT_SCRIPT  变量有误."
    exit 255
  fi
  case "$#" in
  1) launch ;;
  2) launch "$2" ;;
  3) launch "$2" "$3" ;;
  4) launch "$2" "$3" "$4" ;;
  5) launch "$2" "$3" "$4" "$5" ;;
  6) launch "$2" "$3" "$4" "$5" "$6" ;;
  7) launch "$2" "$3" "$4" "$5" "$6" "$7" ;;
  8) launch "$2" "$3" "$4" "$5" "$6" "$7" "$8" ;;
  9) launch "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" ;;
  esac
else
  err "未定义的插件： \"$1\""
  err
  err "你可以使用 tools plugin 查看插件列表"
  exit 255
fi
