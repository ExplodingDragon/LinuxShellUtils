#!/usr/bin/env bash

if [ "$LIB_ENV_LOAD" ]; then
  return
fi
LIB_ENV_LOAD="FINISH"

if [ ! "$TOOLS_WORK_PATH" ]; then
     error "请不要单独执行此脚本."
      exit 255
fi

# 指定环境变量

TOOLS_PLUGIN_PATH="$TOOLS_ROOT_PATH/plugin"

function include() {
  if [ ! -e "$TOOLS_LIB_PATH/lib-$1.sh" ]; then
      echo  "未知库依赖 \"$1\""
      exit 255
  fi
    # shellcheck disable=SC1090
    . "$TOOLS_LIB_PATH/lib-$1.sh"
}
