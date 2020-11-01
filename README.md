# Shell
Shell脚本学习
- account_add.sh  
用于Linux下批量创建用户
- centos_7_system_init.sh  
此脚本用于新装Linux的相关配置工作，比如替换默认yum源，优化系统内核，停掉一些没必要启动的系统服务等。适合大批新安装的Centos系列服务器。
- check_mysql_slave.sh  
MySQL主从监控邮件报警脚本
- check_nginx_pid.sh  
Nginx负载均衡服务器上监控Nginx进程的脚本。
企业负载均衡层如果用到Nginx+Keepalived架构，而Keepalived无法进行Nginx服务的实时切换，所以这里用了一个监控脚本`check_nginx_pid.sh`，每隔5秒就监控一次Nginx的运行状态，如果发现有问题就关闭本机的Keepalived程序，让VIP切换到从Nginx负载均衡器上。
- mysql_backup.sh  
MySQL数据库备份脚本，此脚本是Mysql全量备份+异地备份
一般Mysql数据库备份会采用在MYSQL从库上执行全量备份+增量备份方式。在从库备份避免Mysql主库备份的时候锁表造成业务影响。

## 声明
仅供学习使用  
来源：  
微信公众号：Linux学习  
《鸟哥的Linux学习私房菜》  
