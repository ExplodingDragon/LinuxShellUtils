#!/usr/bin/env bash
UTILS_ROOT_PATH="$(dirname "$(readlink -f "$0")")"
UTILS_BIN_PATH="$UTILS_ROOT_PATH/bin"
UTILS_CONF_PATH="$UTILS_ROOT_PATH/etc"
WORK_PATH="$(pwd)"
export WORK_PATH
. "$UTILS_BIN_PATH/boot-env.sh"

export TOOL_NAME="Bootstrap"
if [ "$#" = 0 ]; then
  # 参数错误
  err "传入参数错误, 你可使用 tools help 查看使用方法"
  exit 255
fi

TOOLS_SCRIPT_PATH="$UTILS_BIN_PATH/tools-$1.sh"
TOOLS_CONF_PATH="${UTILS_CONF_PATH}/$1"
export TOOLS_CONF_PATH
if [ -e "$TOOLS_SCRIPT_PATH" ]; then
  # shellcheck disable=SC1090
  . "${TOOLS_SCRIPT_PATH}"
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
  err "未知指令: \"$1\""
  err
  err "你可以使用 tools help 查看使用方法"
  exit 255
fi
