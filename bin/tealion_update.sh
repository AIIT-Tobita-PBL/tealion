#!/bin/sh

TEALION_ROOT="/home/pi/tealion"


Git_fetch() {
	########################################
	# git clone
	########################################
	echo ""
	echo "Changing dir and makeing git clone."
	echo ""

	TMP_PATH=`pwd`
	cd ../lib/

	echo ""
	echo "Makeing git clone for lifeSound_client."
	git fetch git://github.com/AIIT-Tobita-PBL/lifeSound_client

	echo ""
	echo "Makeing git clone for lifeSoundLog."
	git fetch git://github.com/AIIT-Tobita-PBL/lifeSoundLog

	cd $TMP_PATH
}

cd $TEALION_ROOT/bin
Git_fetch

exit 0
