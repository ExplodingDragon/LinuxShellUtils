#!/usr/bin/env bash

function send_public_key() {
  if [ ! "$1" ]; then
      error "请输入正确的地址信息，例如 root@192.168.1.1"
      exit 255
  fi
  info "即将部署密钥至 $1"

  read -p "将使用公钥 - $HOME/.ssh/id_rsa.pub ? (Y/n) " -r INPUT
  echo "$INPUT"
}
