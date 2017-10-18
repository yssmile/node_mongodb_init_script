# CentOS 7 node and mongodb Enviroment Configuration Script
## Usage
1.you must have user named 'root',the following is under the root user.

2.mkdir /root/work

3.copy the hole script folder to /root/work

4.use 'source oneclicktoconfig.sh',the script can download node and mongodb then config
   their enviroment.
   
5.see mongoinit.sh,you can change mongodb admin user account and password.

6.now mongodb can auto starup on boot.

7.use 'systemctl start/restart/stop mongod.service'
