#!/bin/bash

style='echo -en \033[0;37m';
red='echo -en \033[31m';
std='echo -en \033[0m';

if [ `whoami` == "root" ]
then
	$style;
	echo "Putting script in /usr/bin...";
	if [ "$1" = "-m" ]
	then
	    mv -i battery /usr/bin;
	else
	    cp -i battery /usr/bin;
	fi
	echo "Putting the rights to execute the script...";
	chmod 755 /usr/bin/battery;
	echo "Putting manpage in /usr/share/man/man1...";
	if [ "$1" == "-m" ]
	then
	    mv -i battery.1.gz /usr/share/man/man1;
	    echo "Removing installe.sh...";
	    rm -f installer.sh;
	else
	    cp -i battery.1.gz /usr/share/man/man1;
	fi
else
	$red;
	echo "You need to be root to install correctly the battery script.";
fi
$std;
