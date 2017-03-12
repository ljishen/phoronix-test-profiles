#!/bin/sh

tar -xvf latt-git-20090910204746.tar.gz
cd latt
gcc -Wall -O2 -D_GNU_SOURCE -lrt -lm -lz -lpthread -o latt latt.c
echo $? > ~/install-exit-status

cd ~
echo "#!/bin/sh
./latt/latt 'mplayer --nosound --vo=null --benchmark --hardframedrop \$TEST_VIDEO_SAMPLE/pts-sample-playback-1.avi' \$@ > \$LOG_FILE 2>&1
sed -i '0,/Avg/s//Avg Wakeup/' \$LOG_FILE
sed -i '/Wakeup/! s/Avg/Avg Work/' \$LOG_FILE
echo \$? > ~/test-exit-status" > latt-run
chmod +x latt-run
