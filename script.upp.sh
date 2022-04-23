#!/usr/bin/env bash

for (( c=0; c<$(gpu-detect listjson | jq 'length'); c++ ))
do i=$c;
if [ "$(gpu-detect listjson | jq '.['$i'] | .name')" == '"Radeon RX 6800"' ];
then
echo "GPU $c is RX 6800";
upp -p /sys/class/drm/card$c/device/pp_table setsmc_pptable/FreqTableFclk/0=1550 --write;
else
echo "GPU $c is not supported";
fi
done
