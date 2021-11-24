#!/usr/bin/env bash
# 断言操作
if [ "$LIB_CHECK_LOAD" ]; then
  return
fi
LIB_CHECK_LOAD="FINISH"

include "output"

function assert_programs_exists() {
      for item in "$@"; do
        if ! command -v "$item" >/dev/null 2>&1; then
          echo "错误，模块需要 \"$item\" 命令支持，请安装对应的程序后重试."
          exit 255
        fi
      done
}
