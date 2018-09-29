echo 'start install node'
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


#download node and install
if type node >/dev/null 2>&1; then
 echo "node has installed"
else
	cd 'downloads'
	wget https://nodejs.org/dist/v8.12.0/node-v8.12.0-linux-x64.tar.xz
	tar xvJf node-v8.12.0-linux-x64.tar.xz
	mv node-v8.12.0-linux-x64 /usr/local/node
	echo "export PATH=/usr/local/node/bin:\$PATH" >> /etc/profile
	source /etc/profile
	if  type node >/dev/null 2>&1;  then
		if  type npm >/dev/null 2>&1;  then
			echo "node install success"
		else
			echo "node install failure"
		fi
	else
		echo "node install failure"
	fi
	rm node-v8.12.0-linux-x64.tar.xz
	cd ..
fi