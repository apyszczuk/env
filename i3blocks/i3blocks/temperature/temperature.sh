#!/bin/bash

if [ ! -d "$PATH_TO_TEMPERATURE_FILES" ]; then
	exit 1
fi

arr=($(ls "$PATH_TO_TEMPERATURE_FILES"/temp*_input))

sum=0
for i in ${arr[@]};
do
	n=`expr $(cat $i) / 1000`
	(( sum = $sum + $n ))
done

temperature_no_unit=`expr $sum / ${#arr[@]}`
temperature_with_unit="$temperature_no_unit"°C

echo "$temperature_with_unit"

[ "$temperature_no_unit" -ge "$HIGH_LEVEL" ] && exit 33

exit 0
