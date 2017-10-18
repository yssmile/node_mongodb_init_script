echo 'start installing mongodb'
#install wget
if type wget >/dev/null 2>&1; then
	echo '...'
else
	echo 'start install wget'
	yum -y install wget
fi

#download mongodb and intall
if [ ! -d 'downloads' ]; then
  mkdir 'downloads'
fi


if type mongod >/dev/null 2>&1; then
 echo "mongodb has installed"
else
	cd 'downloads'
	wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-rhel70-3.4.9.tgz
	tar -zxvf mongodb-linux-x86_64-rhel70-3.4.9.tgz

	mv mongodb-linux-x86_64-rhel70-3.4.9 /usr/local/mongodb
	echo "export PATH=/usr/local/mongodb/bin:\$PATH" >> /etc/profile
	source /etc/profile
	if type mongod >/dev/null 2>&1; then
	echo "mongodb install success"
	else
	echo "mongodb install failure"
	fi
	rm mongodb-linux-x86_64-rhel70-3.4.9.tgz
	cd ..
fi