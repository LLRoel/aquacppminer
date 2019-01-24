#!/bin/bash
set -e

if [ "$1" = 'test' ]; then
	PARAMS="-F http://pool.aquachain-foundation.org:8888/0x6e37abb108f4010530beb4bbfd9842127d8bfb3f"
elif [ "$1" = 'pool' ]; then
	PARAMS="-F http://aqua.rektmarketcap.com:8543"
elif [ "$1" = 'solo' ]; then
	PARAMS="--solo -F http://aqua.rektmarketcap.com:8543"
elif [ "$1" = 'debug' ]; then
	exec bash
	exit 0
elif [ "$1" = 'help' ]; then
	cat /README.txt
else
	PARAMS="$@"
fi

if grep -q avx2 /proc/cpuinfo
then
    echo "avx2"
    exec aquacppminer_avx2 $PARAMS
elif grep -q avx /proc/cpuinfo
then
    echo "avx"
    exec aquacppminer_avx $PARAMS
else
    echo "standard"
    exec aquacppminer $PARAMS
fi
