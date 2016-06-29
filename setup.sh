#!/bin/sh

echo -e "wyliodrin\nwyliodrin" | (passwd root)

mkdir /opt

/etc/init.d/sshd stop
/etc/init.d/sshd start

cd node

cp -a bin/. /usr/bin/
cp -a lib/. /usr/lib/
cp -a include/. /usr/include/
cp -a share/. /usr/share/

cd ..

mkdir /opt/wyliodrin
cp wyl /opt/wyliodrin/wyl

ln -s /opt/wyliodrin /wyliodrin

mkdir /wyliodrin/projects
mkdir /wyliodrin/projects/build

cd /wyliodrin/wyl

mkdir /etc/wyliodrin
echo -n cisco829 > /etc/wyliodrin/boardtype
cp setup/settings_cisco829.json /etc/wyliodrin
cp scripts/cisco829/S99wyliodrin-app-server /etc/rc.d/