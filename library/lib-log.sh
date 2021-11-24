#!/usr/bin/env bash
if [ "$LIB_LOG_LOAD" ]; then
  return
fi
LIB_LOG_LOAD="FINISH"

include "output"

TOOL_NAME="Boot"

function get_date() {
  date '+%Y/%m/%d %H:%M:%S'
}

function format() {
  string="$*"
  printf "%10s" "${string// /-}"
}

function debug() {
  if [ ! "$TOOLS_DISABLE_LOG" ]; then
    if [ "$TOOLS_DEBUG" ]; then
      out "\e[33m$(get_date) - \e[34mDEBUG\e[33m - $(format "$TOOL_NAME") \e[0m: $*"
    fi
  fi
}
function info() {
  if [ ! "$TOOLS_DISABLE_LOG" ]; then
    out "\e[32m$(get_date) - \e[34mINFO \e[32m - $(format "$TOOL_NAME") \e[0m: $*"
  fi
}

function error() {
  err "\e[31m$(get_date) - \e[34mERROR\e[31m - $(format "$TOOL_NAME") \e[0m: $*"
}
