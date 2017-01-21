#!/bin/bash

cols=`tput cols`
lines=`tput lines`
lines_less_one=$(( lines - 1 ))
H_cols=$(( cols/2 - MesgLen ))
H_lines=$(( lines/2 ))
MesgLen=15

echo "Cols: $cols"
echo "Lines: $lines"
echo "H_Cols: $H_cols"
echo "H_Lines: $H_lines"
echo "Lines less one: "$lines_less_one

#echo -en '\E[$H_lines;$H_colsH\E[32;40m'"\033[1mKnock Knock Neo\E[$lines_less_one;0H\033[0m"

#Works
#echo -en '\E[20;40H\E[32;40m'"\033[1mKnock Knock Neo\E[40;0H\033[0m"

echo ""
echo "$temp"


#ABOVE IS DEBUGGING

colorarray=(2 10 22 34 46 70 83 112 149)

clear
while true; do

	num1=$RANDOM
	num1=$(( num1 % (cols-1) ))
	num2=$RANDOM
	num2=$(( num2 % (lines-1) ))
	num1=$(( num1 - H_cols ))
	num2=$(( num2 - H_lines ))

	randpick=$RANDOM
	colorarray_len=${#colorarray[*]}
	choice=$(( RANDOM % colorarray_len ))
	colorPickNum=${colorarray[$choice]}

	H_cols_new=$(( H_cols - num1 ))
	H_lines_new=$(( H_lines - num2 ))
	start="\\E["$H_lines_new";"$H_cols_new"H"
	end="\\E["$lines_less_one";0H"
	color="\\E[38;5;"$colorPickNum";40m"
	echo -en $start$color"\E[6mKnock Knock Neo"$end"\033[0m"

	num1=$RANDOM
	num1=$(( num1 % (cols-1) ))
	num2=$RANDOM
	num2=$(( num2 % (lines-1) ))
	num1=$(( num1 - H_cols ))
	num2=$(( num2 - H_lines ))


	H_cols_new=$(( H_cols - num1 ))
	H_lines_new=$(( H_lines - num2 ))
	start="\\E["$H_lines_new";"$H_cols_new"H"
	end="\\E["$lines_less_one";0H"
	echo -en $start"\E[30;40m\E[6mKnock Knock Neo"$end"\033[0m"

	sleep .05
done
