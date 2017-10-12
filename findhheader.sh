#!/bin/bash
#by zyx
function walk()
{
	for file in `ls $1`
	do
		local path=$1
		local itemname=$1"/"$file 
		if [ -d $itemname ]
		then
			#echo "DIR $itemname"
			walk $itemname
		else
			if [ "${itemname##*.}"x = "h"x ]
			then
				echo "DIC $path"
				break 
			fi
		fi
	done
}

if [ $# -ne 1 ]
then
	echo "USAGE: $0 TOP_DIR"
else
	walk $1
fi

