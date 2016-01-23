#!/bin/bash
if [[ $1 != "clean" ]]
then

wla-gb	-vo	main.s &&
wlalink -vs	linkfile testrom.gb

else

rm -f *.o *.gb *.sym *.asc *.sav

fi
