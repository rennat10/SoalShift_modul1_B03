#!/bin/bash

echo "Top country"
s=$(awk -F , 'NR > 1 {if($7=="2012")a[$1] += $10} END{for (i in a) print i","a[i]}' WA_Sales_Products_2012-14.csv | sort -t',' -nrk2 | awk -F , 'NR < 2 {print $1}')
echo "$s"


echo "Top 3 product line from $s"
awk -F , -v s="$s" 'NR > 1 {if($7 == "2012" && $1 == s) a[$4] += $10} END{for (i in a) print i","a[i]}' WA_Sales_Products_2012-14.csv | sort -t"," -nrk2 | awk -F , 'NR < 4 {print $1}' > "tes.txt"
for i in 1 2 3
do
	read -r line
	echo "$line"
done < "tes.txt"

#9 output
for i in 1 2 3
do
	read -r line
	echo "Top 3 product in product line $line"
	d=$(awk -F , -v f="$line" -v s="$s" 'NR > 1{if($1 == s && $4 == f && $7 == 2012) a[$6] += $10} END{for (i in a) print i"," a[i]}' WA_Sales_Products_2012-14.csv | sort -t',' -nrk2 | awk -F , 'NR < 4 {print $1}')
	echo "$d"
done < "tes.txt"
rm "tes.txt"

#3 output
#	echo "Top 3 product"
#for i in 1 2 3
#do
#	read -r line
#	d=$(awk -F , -v f="$line" -v s="$s" 'NR > 1{if($1 == s && $4 == f && $7 == 2012) a[$6] += $10} END{for (i in a) print i"," a[i]}' WA_Sales_Products_2012-14.csv | sort -t',' -nrk2 | awk -F , 'NR < 2 {print $1}')
#	echo "$d"
#done < "tes.txt"
#rm "tes.txt"