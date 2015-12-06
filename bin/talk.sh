#!/bin/sh
#echo "こんにちは" | open_jtalk -x /var/lib/mecab/dic/open-jtalk/naist-jdic -m $TEALION_ROOT/share/hts_voice_nitech_jp_atr503_m001-1.05/nitech_jp_atr503_m001.htsvoice -ow $TEALION_ROOT/share/talk/test.wav
open_jtalk -x /var/lib/mecab/dic/open-jtalk/naist-jdic -m $TEALION_ROOT/share/hts_voice_nitech_jp_atr503_m001-1.05/nitech_jp_atr503_m001.htsvoice -ow $TEALION_ROOT/share/talk/test.wav $TEALION_ROOT/share/talk/tts.txt
