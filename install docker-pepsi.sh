#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

#=================================================
#	System Required: CentOS 6/7,Debian 8/9,Ubuntu 16+
#	Description: 
#	Version: 1.0.1
#=================================================

#安装Docker
yum install -y yum-utils device-mapper-persistent-data lvm2
#添加docker-ce yum仓库
#因为在阿里云的ecs机器上面，yum镜像使用的阿里云的，找不到docker的镜像，所以需要第一步的安装基础工具之后使用yum-config-manager来添加对应的yum仓库，执行如下命令
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#安装Docker-ce[需要耐心的等待大概3-5分钟]
yum install docker-ce
#启动docker服务
systemctl start docker
#关闭docker服务
systemctl stop docker 
#自动安装docker
curl -sSL https://get.daocloud.io/docker | sh
#查看docker版本
docker -v
#下载docker-compose
curl -L https://get.daocloud.io/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
#赋予权限
chmod a+x /usr/local/bin/docker-compose
#查看docker-compose版本
docker-compose --version
#运行pepsi容器
docker run -d --restart=always --name=V2ray.server -p 59028:59028 -p 59028:59028/udp lousd996/pepsi && docker ps
