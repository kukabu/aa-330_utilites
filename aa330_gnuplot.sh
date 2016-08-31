#!/bin/bash

while read tag
do
   if [ "x$tag" == "xS" ]
   then
      break
   fi
done

if [ "x$tag" == "xS" ]
then
   >&2 echo "Start tag found"
else
   >&2 echo "Start tag not found. Something wrong!"
   exit 1
fi

read freq_start
read freq_end 
read freq_step

case "$freq_step" in
   "01" )
    freq_step=250
   ;;
   "02" )
    freq_step=100
   ;;
   "03" )
    freq_step=10
   ;;
   "04" )
    freq_step=1
   ;;
   * )
    >&2 echo "bad step - $freq_step"
    exit 1
esac

freq_start=`expr $freq_start + 0`
freq_end=`expr $freq_end + 0`

>&2 echo "Range $freq_start - $freq_end step $freq_step [kHz]"

freq=$freq_start
while [ "$freq" -le "$freq_end" ]
do
    IFS=\; read SWR R X
    SWR=`expr $SWR + 0`
    R=`expr $R + 0`
    X=`expr $X + 0`
    printf "%d %d %d %d\n" $freq $SWR $R $X
    freq=$(($freq + $freq_step))
done

read tag
if [ "x$tag" == "xE" ]
then
   >&2 echo "End tag found"
else
   >&2 echo "End tag not found. Something wrong!"
   exit 1
fi

exit 0
