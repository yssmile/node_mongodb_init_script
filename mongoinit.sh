echo 'start config mongodb'
#1.create the dirs
if [ ! -d '/root/work/db/mongodb' ]; then
  mkdir -p '/root/work/db/mongodb' #mongodb data file dir
fi


if [[ ! -d '/root/work/db/log/mongodb/' ]]; then
	mkdir -p '/root/work/db/log/mongodb/'  #mongodb log file dir
fi

if [[ ! -d '/var/run/mongodb/' ]]; then
	mkdir -p '/var/run/mongodb/' #mongodb pid file dir
fi

if [[ ! -d '/root/work/db/config' ]]; then
	mkdir -p '/root/work/db/config'
fi

mv /root/work/mongod.conf /root/work/db/config
mv /root/work/mongod.service /lib/systemd/system/mongod.service
chmod 755  /lib/systemd/system/mongod.service

systemctl enable mongod.service #设置开机启动
systemctl start mongod.service	#启动mongo服务
echo '...'
sleep 1
mongo<<!
use admin
db.createUser({user: "admin",pwd: "admin123",roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]})
exit
!
systemctl stop mongod.service