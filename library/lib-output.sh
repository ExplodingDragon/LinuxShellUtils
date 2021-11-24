#!/usr/bin/env bash
if [ "$LIB_OUTPUT_LOAD" ]; then
  return
fi
LIB_OUTPUT_LOAD="FINISH"
. "$TOOLS_LIB_PATH/lib-env.sh"

# 标准输出
function out() {
  echo -e "$*"
}

function err() {
  echo -e "$*" >&2
}
