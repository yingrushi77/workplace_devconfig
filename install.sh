#!/bin/bash

#       _                            _     _ 
# _   _(_)_ __   __ _ _ __ _   _ ___| |__ (_)
#| | | | | '_ \ / _` | '__| | | / __| '_ \| |
#| |_| | | | | | (_| | |  | |_| \__ \ | | | |
# \__, |_|_| |_|\__, |_|   \__,_|___/_| |_|_|
# |___/         |___/ 
#





# 更新apt软件源
function apt_update() {
    apt update > /dev/null
    is_command_exec_success "apt update"
}

# 判断一个命令是存在
function is_command_exist() {
    echo "判断命令 $1 是否存在"
    type $1 > /dev/null
    if [ 0 == $? ]
    then
        echo "命令 $1 存在"
        return 9
    else
        echo "命令 $1 不存在"
        return 6
    fi
}

# 安装neofetch  一个显示系统信息的工具
function install_neofetch() {
    is_command_exist neofetch
    if [ 6 == $? ]
    then
        echo 6 70 | apt install neofetch -y > /dev/null
        is_command_exec_success "install neofetch"
    fi
}

# 判断命令是否执行成功
function is_command_exec_success() {
    if [ 0 == $? ]
    then
        echo "$1 执行成功！"
    else
        echo "$1 执行失败！"
    fi
}

# 安装字符打印软件figlet
function install_figlet() {
    is_command_exist figlet
    if [ 6 == $? ]
    then
        apt install figlet -y > /dev/null
        is_command_exec_success "install figlet"
    fi
}

# 安装终端复用软件tmux
function install_tmux() {
    is_command_exist tmux
    if [ 6 == $? ]
    then
        apt install tmux -y > /dev/null
        is_command_exec_success "install tmux"
    fi
}

# 安装终端文件管理软件joshuto
function install_joshuto() {
    is_command_exist cargo
    if [ 6 == $? ]
    then
        apt install cargo -y > /dev/null
        is_command_exec_success "install cargo"
    fi
    is_command_exist cargo
    if [ 9 == $? ]
    then
        cd ~
        git clone --recursive https://github.com/kamiyaa/joshuto.git
        cd joshuto
        cargo install --path=. --force --root=/usr/local
        is_command_exec_success "install joshuto"
    fi
}

# 更新git 防止拉仓库异常报错
function git_update() {
    ehco -e "\n" | add-apt-repository ppa:git-core/ppa
    apt update
    apt install git -y
    is_command_exec_success "update git"
}

# 安装bat软件 cat查看工具的升级版本
function install_bat() {
    is_command_exist bat
    if [ 6 == $? ]
    then
        dpkg -i bat-musl_0.23.0_amd64.deb
        is_command_exec_success "install bat"
    fi
}

# 把joshuto配置文件放到 ~/.config目录下
function copy_joshuto_config() {
    cp -r .config/joshuto ~/.config
    is_command_exec_success "copy joshuto config"
}

# 开始安装软件
function main() {
    echo "*********************************"
    apt_update
    echo "*********************************"
    install_bat
    echo "*********************************"
    install_figlet
    echo "*********************************"
    install_joshuto
    echo "*********************************"
    install_neofetch
    echo "*********************************"
    install_tmux
    echo "*********************************"
    copy_joshuto_config
}

main
