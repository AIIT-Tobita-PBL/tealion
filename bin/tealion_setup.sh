#!/bin/sh
Check_ENV() {
	if [ -z "$HOYA_API" ]; then
		echo 'You need setting a environment variable of "HOYA_API", that is a api_key for textVoice of HOYA.'
		echo "Set it, then run again."
		read Wait
		exit 0
	fi
}

Download_voiceText() {
	########################################
	# Download HOYA textVoice
	########################################
	echo ""
	echo "Downloading HOYA voiceText."
	echo ""

	TMP_PATH=`pwd`
	cd ../share/voice/speech

	curl "https://api.voicetext.jp/v1/tts" -o "hello.wav" -u "$HOYA_API:" -d "text=こんにちは" -d "speaker=hikari" -d "emotion=happiness" -d "emotion_level=3" -d "pitch=80" -d "speed=120"
	curl "https://api.voicetext.jp/v1/tts" -o "question.wav" -u "$HOYA_API:" -d "text=何か質問があります？" -d "speaker=hikari" -d "emotion=happiness" -d "emotion_level=3" -d "pitch=80" -d "speed=120"
	curl "https://api.voicetext.jp/v1/tts" -o "handwash.wav" -u "$HOYA_API:" -d "text=手洗い音を検知しました" -d "speaker=hikari" -d "emotion=happiness" -d "emotion_level=3" -d "pitch=80" -d "speed=120"

	cd $TMP_PATH
}

Git_clone() {
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
	git clone git://github.com/AIIT-Tobita-PBL/lifeSound_client

	echo ""
	echo "Makeing git clone for lifeSoundLog."
	git clone git://github.com/AIIT-Tobita-PBL/lifeSoundLog

	cd $TMP_PATH
}

Display_finished() {
	########################################
	# Finished
	# Display caution
	########################################
	echo ""
	echo "Finished without download Julius model."
	echo "Download it by youself from https://github.com/julius-speech/julius/releases/download/v4.3.1/julius-4.3.1-linuxbin.tar.gz"
}

cd $TEALION_ROOT/bin
Check_ENV
Download_voiceText
Git_clone
Display_finished

exit 0
