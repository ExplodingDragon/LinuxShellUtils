#!/usr/bin/env bash

if [ "$ENV_LOAD" ]; then
  return
fi
ENV_LOAD="true"

TOOL_NAME="Bootstrap"

function out() {
  echo -e "$*"
}

function err() {
  echo -e "$*" >&2
}

function get_date() {
  date '+%Y/%m/%d %H:%M:%S'
}

function format() {
  string="$*"
  printf "%15s" "${string// /-}"
}

function debug() {
  if [ ! "$UTILS_DISABLE_LOG" ]; then
    if [ "$UTILS_DEBUG" ]; then
      out "\e[33m$(get_date) - \e[34mDEBUG\e[33m - $(format "$TOOL_NAME") \e[0m: $*"
    fi
  fi
}
function info() {
  if [ ! "$UTILS_DISABLE_LOG" ]; then
    out "\e[32m$(get_date) - \e[34mINFO \e[32m - $(format "$TOOL_NAME") \e[0m: $*"
  fi
}

function error() {
  err "\e[31m$(get_date) - \e[34mERROR\e[31m - $(format "$TOOL_NAME") \e[0m: $*"
}

if [ ! "$UTILS_ROOT_PATH" ]; then
  error "请不要单独执行此脚本."
  exit 255
fi

source "$UTILS_CONF_PATH/tools.conf"
