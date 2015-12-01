#!/bin/sh

TEALION_ROOT="/home/pi/tealion"


Git_pull() {
	github_rep=$1
	dir_name=$2

	TMP_PATH=`pwd`
	cd ../$dir_name/

	echo ""
	echo "pull $github_rep."
	cd $github_rep
	git pull
	#bundle install
	cd ../../bin/

}


########################################
# git pull
########################################
echo ""
echo "update from github."
echo ""

cd $TEALION_ROOT/bin
Git_pull lifeSound_client lib
Git_pull lifeSoundLog lib
Git_pull dictation-kit share

exit 0
