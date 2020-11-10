FROM ubuntu:18.04
RUN apt update && apt install wget -y && export PUPPET_PACKAGE="https://apt.puppetlabs.com/puppet6-release-$(cat /etc/lsb-release | grep CODENAME | awk -F '=' '{print $2}').deb" && wget $PUPPET_PACKAGE && dpkg -i $(echo $PUPPET_PACKAGE | awk -F "/" '{print $NF}') && apt update && apt-get install puppetserver -y

VOLUME /opt/puppetserver
