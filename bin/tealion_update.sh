#!/bin/sh

TEALION_ROOT="/home/pi/tealion"


Git_fetch() {
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
	git fetch git://github.com/AIIT-Tobita-PBL/lifeSound_client
	bundle install
	cd ../

	echo ""
	echo "fetch lifeSoundLog."
	cd lifeSoundLog
	git fetch git://github.com/AIIT-Tobita-PBL/lifeSoundLog
	bundle install
	cd ../

	cd $TMP_PATH
}

cd $TEALION_ROOT/bin
Git_fetch

exit 0
