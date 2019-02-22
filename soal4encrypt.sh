#!/bin/bash

hKecil=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
hBesar=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

menit=`date "+%X" | awk -F: '{print $2}'`
jam=`date "+%X" | awk -F: '{print $1}'`
tanggal=`date | awk '{print $3}'`
bulan=`date | awk '{print $2}'`
tahun=`date | awk '{print $6}'`

kecila1=${hKecil[$jam]}
kecilb1=${hKecil[$((jam-1))]}
echo "$kecila"
echo "$kecilb"
besara1=${hBesar[$jam]}
besarb1=${hBesar[$((jam-1))]}

cat /var/log/syslog | tr [a-z] ["$kecila1"-za-"$kecilb1"] | tr [A-Z] ["$besara1"-ZA-"$besarb1"] > "$jam:$menit $tanggal-$bulan-$tahun".txt
