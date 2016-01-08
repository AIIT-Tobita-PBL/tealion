#!/bin/sh
TEALION_TMP_WAV=/tmp/tealion/openjtalk.wav
echo "$1" | open_jtalk -x /var/lib/mecab/dic/open-jtalk/naist-jdic -m $TEALION_ROOT/share/hts_voice_nitech_jp_atr503_m001-1.05/nitech_jp_atr503_m001.htsvoice -ow $TEALION_TMP_WAV
aplay --quiet $TEALION_TMP_WAV
rm -f $TEALION_TMP_WAV
