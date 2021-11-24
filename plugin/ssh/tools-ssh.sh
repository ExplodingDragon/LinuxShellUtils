#!/usr/bin/env bash

include "output"
include "check"
include "help-output"
include "push-key"

assert_programs_exists ssh scp

function launch() {
  case "$1" in
  "push-key")
    send_public_key "$2"
    ;;
  *)
    err "未知指令 \"$1\""
    exit 255
    ;;
  esac
}

function tools_help() {
  out "针对 OpenSSH 连接和管理的小工具"
  out
  out "- push-key [user]@[address] : 部署公钥到对应的机器"
}
