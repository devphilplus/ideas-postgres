# ideas-postgres

# 如何使用这个开源项目
## 一、克隆项目到本地
如果已经安装了 Git 则使用下面的命令，如果没有安装，可以直接去网站上下载项目压缩包
```
git clone https://github.com/devphilplus/ideas-postgres
```

## 二、安装 PG
1. 下载地址：https://www.postgresql.org/download/
2. 安装时记得设置的账号密码，后面会用到
3. 安装后，找到安装路径里的bin所在路径，将其添加到操作系统环境变量的Path里，比如我的路径：D:\Program Files\PostgreSQL\15\bin，这一步的作用是，之后在命令行工具里执行psql命令，不用写前面这个路径名

## 三、本地连接数据库
```
-- 打开命令行工具
-- 如 VSCode上的终端，CMD，Power Shell 等
-- 连接到PG
psql -h localhost -p 5432 -U postgres
-- 回车后会需要输入密码，记得输入安装 PG 时设置的密码
-- 这里 localhost 代表本地，如果不是本地请输入IP，5432是端口号，
-- 安装 PG 时如果没有改，默认是5432，postgres 是 PG 用户名，安装 PG 时默认是这个
```

## 四、本地连接数据库并用命令行工具执行脚本文件
```
-- 连接上指定数据库后，执行 create.sql 脚本文件
-- 首先命令行移动路径，要么移动到 create.sql 所在目录，要么下面文件写上路径。
-- 如果要移动目录使用 cd 命令
-- 下面的命令是移动到了脚本所在目录 PS D:\code\postgreSQL\ideas-postgres>
PS D:\code\postgreSQL\ideas-postgres>\i ./create.sql
```

其它 PSQL 入门命令
```
-- 切换数据库
\c 数据库名
-- 连接 PG 指定数据库
psql -h localhost -p 5432 -U [username] -d [database]
-- 创建数据库，注意大小写
CREATE DATABASE ideas;
-- 断开连接
\q
```
