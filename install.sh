#!/bin/bash
# Speedtest installer. Reference https://www.speedtest.net/apps/cli
# Creared by Yevgeniy Goncharov, https://sys-adm.in

curl -s https://install.speedtest.net/app/cli/install.rpm.sh | sudo bash
yum -y install speedtest

# Run speedtest
speedtest