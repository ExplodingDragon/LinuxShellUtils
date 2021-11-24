#!/usr/bin/env bash
# 项目启动类

# 加载全局配置
# shellcheck disable=SC2034
TOOLS_WORK_PATH="$(pwd .)"                                         # 工作目录
TOOLS_ROOT_PATH="$(dirname "$(dirname "$(readlink -f "$0")")../")" # 程序根目录
TOOLS_LIB_PATH="$TOOLS_ROOT_PATH/library"
. "$TOOLS_ROOT_PATH/config.sh"
. "$TOOLS_LIB_PATH/lib-env.sh" # 全局加载
. "$TOOLS_LIB_PATH/core.sh" "$@"
