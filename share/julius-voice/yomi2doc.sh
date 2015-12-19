#!/bin/sh
iconv -f utf8 -t eucjp word.yomi | yomi2voca.pl >word.dic
