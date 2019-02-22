# SoalShift_modul1_B03
<h3>No. 1</h3>
<h4>Soal</h4>
<p>
  Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.
Hint: Base64, Hexdump
</p>
<a href="https://github.com/rennat10/SoalShift_modul1_B03/blob/master/soal1.sh">  
  Full Code
</a>
<h4>
1. Pertama-tama unzip lah file nature.zip terlebih dahulu
2. Lalu buatlah file decrypt seperti Source code dibawah ini
#!/bin/bash
#sebagai iterator
i=1 
#for untuk melakukan decrypt file sebanyak file .jpg dalam folder nature
for eachfile in ./nature/*.jpg
do
  #melakukan decrypt menggunakan base64 dan hexdump 
  base64 -d $eachfile | xxd -r > $i.jpg 
  #increment iterator
  i=$((i+1))
done
</h4>
<h3>No. 2</h3>
<h4>Soal</h4>
<p>
  Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:

    a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
    b. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
    c. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.
</p>

<a href="https://github.com/rennat10/SoalShift_modul1_B03/blob/master/soal2.sh">  
  Full Code
</a>

<h4>Jawab</h4>
<h5>a</h5>

```
awk -F , 'NR > 1 {if($7=="2012")a[$1] += $10} END{for (i in a) print i","a[i]}' WA_Sales_Products_2012-14.csv | sort -t',' -nrk2 | awk -F , 'NR < 2 {print $1}'
```
<p>Pada soal nomor 2 poin a, kita diminta untuk mengeluarkan negara dengan penjualan (quantity) terbanyak pada tahun 2012, sehingga: </p>
<p> (i) Langkah pertama yang kami lakukan adalah dengan memisahkan mereka ke dalam beberapa argumen (atau apabila dalam excel kita menyebutnya kolom) dengan menggunakan "awk -F ," dimana yang berarti memisahkan mereka berdasarkan delimiter ","</p>
<p> (ii) Langkah selanjutnya, kami menggunakan baris dimana baris nya lebih dari 1 (Nama dari setiap kolom seperti Retailer country, Year, dll) dan menjumlahkan quantity mereka yang di kelompokkan berdasarkan negara dengan menggunakan array dimana quantity berada pada kolom 10, dan negara pada kolom 1, dan dengan syarat bahwa penjualan berada pada tahun 2012 yaitu dimana tahun berada pada kolom 7 </p>
<p> (iii) Langkah ketiga, yaitu dengan melakukan looping untuk mencetak nama dan jumlah penjualan dari setiap negara yang dipisahkan dengan delimiter ","</p>
<p> (iv) Langkah keempat, dengan mensorting dimana "-t ','" memiliki arti bahwa tiap kolom dipisahkan dengan delimiter "," dan "-nrk2" berarti bahwa sorting berdasarkan nilai numerik secara descending pada kolom ke 2</p>
<p> (v) Langkah kelima, kami melakukan awk lagi untuk mencetak negara dengan penjualan (quantity) tertinggi, "awk -F ," berarti bahwa kita akan membaginya ke beberapa kolom dengan pemisah tiap kolom tersebut adalah "," dan "'NR < 2 {print $1}'", NR < 2 berguna untuk memfilter bahwa hasil yang dikeluarkan hanyalah 1 baris, sedangkan {print $1} adalah mengeluarkan argumen pertama (kolom pertama) dari hasil filter kita
  
<h5>b</h5>

```
awk -F , -v s="$s" 'NR > 1 {if($7 == "2012" && $1 == s) a[$4] += $10} END{for (i in a) print i","a[i]}' WA_Sales_Products_2012-14.csv | sort -t"," -nrk2 | awk -F , 'NR < 4 {print $1}' > "tes.txt"
for i in 1 2 3
do
	read -r line
	echo "$line"
done < "tes.txt"
```

<p> (i) Line pertama pada kodingan tersebut memiliki penjelasan yang sama dengan poin a, akan tetapi ada beberapa tambahan yaitu, syarat nya bahwa negaranya (yang berada pada kolom 1) adalah hasil dari output pada poin a yang didefinisikan sebagai variable s, dan yang kita jumlahkan merupakan kolom 4 yaitu product line, dan output dari poin b ini dimasukkan kedalam file "tes.txt"</p>
<p> (ii) Lalu untuk line kedua, sampai terakhir, kita melakukan looping sebanyak 3 kali dikarenakan kita hanya mengeluarkan 3 hasil dengan penjualan product line terbanyak.</p>
<p> (iii) "read -r line" berarti bahwa dari tes.txt kita mengambil 1 baris sebagai input dalam variable line, dan kita mengeluarkannya pada baris selanjutnya yaitu, " echo "$line" "</p>
<h5>c</h5>

```
for i in 1 2 3
do
	read -r line
	echo "Top 3 product in product line $line"
	d=$(awk -F , -v f="$line" -v s="$s" 'NR > 1{if($1 == s && $4 == f && $7 == 2012) a[$6] += $10} END{for (i in a) print i"," a[i]}' WA_Sales_Products_2012-14.csv | sort -t',' -nrk2 | awk -F , 'NR < 4 {print $1}')
	echo "$d"
done < "tes.txt"
rm "tes.txt"
```

<p> (i) Pada kodingan tersebut, kita me looping 3 kali untuk mendapatkan hasil dari setiap product line yang dihasilkan dari nomer pada poin b</p>
<p> (ii) Lalu untuk baris 3 sampai dengan 7, berguna untuk mendapatkan 1 baris pada hasil dari poin b dan mencari 3 produk tertinggi untuk setiap product line.</p>
<p> (iii) Untuk mencari 3 product tertinggi, kita menggunakan cara yang hampir sama dengan poin a, akan tetapi memiliki beberapa tambahan yaitu, berada pada negara yang dihasilkan pada poin a, dan juga mempunyai product line yang telah dihasilkan pada poin b, dimana hasil pada poin a disimpan dalam variable s, dan hasil pada poin b disimpan dalam variable line, atau di awk disimpan dalam f</p>

<h3>No. 3</h3>
<h4>Soal</h4>

<p>
  Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:

    a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt
    b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.
    c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
    d. Password yang dihasilkan tidak boleh sama. 
</p>

<a href="https://github.com/rennat10/SoalShift_modul1_B03/blob/master/soal3.sh">
  Full Code
</a>

<h4>Jawab</h4>

<p> (i) Insial variabel:</p>

```
suffix=1
```

Karena nama file dimulai dari password1.txt, maka suffix kita insialisasi dengan nilai 1

<p> (ii) Selama file password$suffix.txt ada, maka jumlahkan suffix sebanyak 1, sampai password$suffix.txt not exist, dan keluar dari looping</p>

```
while [ True ]
do
	if [[ -f ~/Sisop/password$suffix.txt ]]; then
		suffix=$((suffix + 1))
	else
		cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c12 > ~/Sisop/password$suffix.txt
		break
	fi
done
```
<h3>No. 4</h3>
<h4>Soal</h4>
<p>
Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:
        a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.
        b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya. 
        c. setelah huruf z akan kembali ke huruf a
        d. Backup file syslog setiap jam.
        e. dan buatkan juga bash script untuk dekripsinya.
</p>
<a href="https://github.com/rennat10/SoalShift_modul1_B03/blob/master/soal4encrypt.sh">
  Full Code
</a>
<a href="https://github.com/rennat10/SoalShift_modul1_B03/blob/master/soal4decrypt.sh">
  Full Code
</a>
<h3>No. 5</h3>
<h4>Soal</h4>
<p>
  Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:

    a. Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.
    b. Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.
    c. Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.
    d. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.
</p>

<a href="https://github.com/rennat10/SoalShift_modul1_B03/blob/master/soal5.sh">
  Full Code
</a>

<a href="https://github.com/rennat10/SoalShift_modul1_B03/blob/master/Crontab">
  Crontab
</a>

<p> (i) "cat /var/log/syslog" Berguna untuk menyimpan record pada syslog</p>
<p> (ii) "awk ' /[cC][rR][oO][nN]/ && !/[sS][uU][dD][oO]/ {print $0;}'", pada command tersebut, berguna untuk mencari yang mengandung string cron dan tidak mengandung string sudo, dan pencarian tidak bersifat case sensitive. Untuk command "/[cC][rR][oO][nN]/" dan "!/[sS][uU][dD][oO]/" berguna untuk menghilangkan case sensitive, dimana [cC] berarti bahwa huruf dapat c ataupun C, dan begitu seterusnya. Dan {print $0} berguna untuk mengeluarkannya dalam 1 baris</p>
<p> (iii) "awk 'NF < 13'" Berguna untuk menbatasi untuk jumlah fieldnya kurang dari 13</p>
<p> (iv) "cat /var/log/syslog | awk ' /[cC][rR][oO][nN]/ && !/[sS][uU][dD][oO]/ {print $0;}' | awk 'NF < 13' >> ~/Sisop/Modul1/output.log" dan file tersebut disimpan dalam ~/modul1/ </p>

<h4>Jawab</h4>
<p></p>
