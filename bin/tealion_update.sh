#!/bin/sh

TEALION_ROOT="/home/pi/tealion"


Git_pull() {
	########################################
	# git fetch
	########################################
	echo ""
	echo "Changing dir and makeing git clone."
	echo ""

	TMP_PATH=`pwd`
	cd ../lib/

	echo ""
	echo "fetch lifeSound_client."
	cd lifeSound_client
	git pull
	bundle install
	cd ../

	echo ""
	echo "fetch lifeSoundLog."
	cd lifeSoundLog
	git pull
	bundle install
	cd ../

	cd $TMP_PATH
}

cd $TEALION_ROOT/bin
Git_pull

exit 0
