#!/usr/bin/env bash
echo "SSH 安装脚本"
PUBLIC_KEY="<template:PUBLIC_KEY>"
function install() {
  if [ ! "$1" ]; then
    return
  fi
  mkdir --parents "$(dirname "$1")"
  if [ -e "$1" ]; then
    echo "$PUBLIC_KEY" >>"$1"
  else
    echo "授权文件不存在，将创建新的文件"
    echo "$PUBLIC_KEY" >"$1"
    chmod 600 "$1"
  fi
  echo "密钥已部署"
}
if [ -s "/etc/ssh/sshd_config" ]; then
  # shellcheck disable=SC2002
  SSH_AUTH_PATH="$(cat "/etc/ssh/sshd_config" | grep AuthorizedKeysFile | sed -e "s/# *//g" -e "s/^ *//g" | awk '{print $2}')"
  echo "系统指定的SSH密钥位置为 $SSH_AUTH_PATH"
  install "$HOME/$SSH_AUTH_PATH"
else
  echo "未找到 ssh 配置文件，跳过密钥部署."
fi
