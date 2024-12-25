#!/bin/bash
# Speedtest installer. Reference https://www.speedtest.net/apps/cli
# Creared by Yevgeniy Goncharov, https://sys-adm.in


distro=$(lsb_release -is)

add_speedtest_repo() {
    if [[ $distro == "Debian" ]]; then
        echo "Adding Speedtest repo for Debian..."
        curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
    elif [[ $distro == "CentOS" ]]; then
        echo "Adding Speedtest repo for CentOS..."
        curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | sudo bash
    else
        echo "Unknown distro: $distro"
        echo "Exit. Bye!"
        exit 1
    fi
}

install_speedtest() {
    echo "Устанавливаем пакет Speedtest CLI..."
    sudo apt-get update && sudo apt-get install speedtest -y || sudo yum update && sudo yum install speedtest -y
}

add_speedtest_repo
install_speedtest

echo "Speedtest CLI installed!"