#!/bin/bash

hKecil=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
hBesar=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

echo $1
jam=`echo $1 | awk -F: '{print $1}'`
#jam=`echo "$jam" | bc`
echo "$jam"
kecila=${hKecil[$((26-jam))]}
kecilb=${hKecil[$((26-(jam-1)))]}
besara=${hBesar[$((26-jam))]}
besarb=${hBesar[$((26-(jam-1)))]}

jam=`echo $1 | awk -F: '{print $1}'`
menit=`echo $1 | awk '{print $1}' | awk -F: '{print $2}'`
tanggal=`echo $1 | awk '{print $2}' | awk -F- '{print $1}'`
bulan=`echo $1 | awk '{print $2}' | awk -F- '{print $2}'`
tahun=`echo $1 | awk '{print $2}' | awk -F- '{print $3}' | awk -F. '{print $1}'`

cat "$jam:$menit $tanggal-$bulan-$tahun".txt | tr [a-z] ["$kecila"-za-"$kecilb"] | tr [A-Z] ["$besara"-ZA-"$besarb"] > "$jam:$menit $tanggal-$bulan-$tahun-decrypted".txt
