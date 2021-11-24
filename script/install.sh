#!/usr/bin/env bash
echo "#######################################"
echo
printf "\t Tools Installer\n"
echo
echo "#######################################"

if ! command -v git >/dev/null 2>&1; then
  echo "错误，安装程序需要 git 支持."
  exit 255
fi

INSTALL_DIR="$HOME/.oh-my-tools/"
git clone "https://github.com/ExplodingDragon/LinuxShellUtils.git" "$INSTALL_DIR"
cd "$INSTALL_DIR" || exit
git pull
cd - || exit

echo "安装完毕，请添加如下命令到 shell 配置中."
echo
echo "source ~/.oh-my-tools/tools-env.sh"

exit 0
