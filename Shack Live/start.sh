#!/bin/bash

_update() {
	echo "Updating Pavlov VR";
        cd ~/Steam && ./steamcmd.sh +login anonymous +force_install_dir /home/steam/pavlovserver +app_update 622970 -beta shack +exit
}

_run() {
	echo "Running Pavlov VR Server";
        cd ~/pavlovserver && ./PavlovServer.sh
}

case $1 in
"update")
	_update
	;;
	
"run")
	_run
	;;

*)
	_update
	_run
	;;
esac

