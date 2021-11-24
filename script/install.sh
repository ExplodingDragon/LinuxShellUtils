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
echo "安装工具包到目录 $INSTALL_DIR 下"
git clone "https://github.com/ExplodingDragon/LinuxShellUtils.git" "$INSTALL_DIR" > /dev/null 2>&1
cd "$INSTALL_DIR" || exit
echo "尝试升级软件包"
git pull
cd - > /dev/null 2>&1 || exit

echo "安装完毕，请添加如下命令到配置中."
echo
echo "source ~/.oh-my-tools/tools-env.sh"

exit 0
