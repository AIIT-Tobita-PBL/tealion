#!/bin/sh

TEALION_ROOT="/home/pi/tealion"


Git_pull() {
	########################################
	# git pull
	########################################
	echo ""
	echo "update from github."
	echo ""

	TMP_PATH=`pwd`
	cd ../lib/

	echo ""
	echo "pull lifeSound_client."
	cd lifeSound_client
	git pull
	bundle install
	cd ../

	echo ""
	echo "pull lifeSoundLog."
	cd lifeSoundLog
	git pull
	bundle install
	cd ../

	cd $TMP_PATH
}

cd $TEALION_ROOT/bin
Git_pull

exit 0
