# 通过vscode进入container方法

## 需要安装的VScode工具

Docker

remote-ssh(如果在linux上配置的话需要这个插件来进行docker-compose up)

## 操作方法

### 1. 连接windows和linux

安装和remote-ssh后，在VS code中按`F1`,输入Remote-SSH:Connect to Host,enter确定，然后它会让你选择config文件放在哪里，回车即可新建并编辑config文件。
config文件必须放到被授权的rsa秘钥所在的文件目录，可以看到我这个目录下的文件是这样的：

config文件是Remote-SSH的配置文件，表示我们将使用这个文件夹下的rsa秘钥文件去登录远程服务器。

config文件的配置项如下：

```
Host serveTest
  HostName 192.168.3.29
  User root
  IdentityFile C:\Users\yjl\.ssh\id_rsa
```

> serveTest：服务器名
>
> 192.168.3.29：linux机的ip地址（可在虚拟机中使用命令ifconfig查看）
>
> root：登录的用户名，默认root为权限所有者
>
> C:\Users\yjl\.ssh\id_rsa :公钥位置

配置完成之后打开左侧边栏的电脑小图标，会出现一个名为serveTest的列，点击其右侧的文件夹按钮，即可在新窗口中打开虚拟机的远程链接，如果配置正确，会打开一个新窗口，连接错误的话请检查config是否有配置正确，然后在点击文件>打开文件夹即可

### 2.使用vscode进入docker container

安装好docker后，首先需要用刚刚的vscode小窗口中的命令行跑起docker容器（可以使用docker-compose up跑起），然后在左侧有鲸鱼标识，点击containers即可