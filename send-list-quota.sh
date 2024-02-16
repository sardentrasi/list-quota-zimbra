#!/bin/bash

BASHPATH=/opt/scripts/list-quota

# Hari ini
today=$(date +%Y-%m-%d)

# Run script

$BASHPATH/bin/check-quota.pl > $BASHPATH/log/$today.csv

#edit file
#sed -i 's/ /;/g' $BASHPATH/log/temp/$today.txt

#hitung presentasi
#$BASHPATH/bin/cal-per.pl > $BASHPATH/log/$today.csv

#ubah spasi
#sed -i 's/;\(Bytes\|KB\|MB\|GB\|TB\)/ \1/g' $BASHPATH/log/$today.csv
sed -i '1i Email;Usage;TotalQuota;Percentage' $BASHPATH/log/$today.csv


# Send Email Report

echo "Kirim Log!"
php-cgi -q $BASHPATH/mailersend.php "file_attach=log/$today.csv"
