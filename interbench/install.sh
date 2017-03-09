#!/bin/sh

unzip master.zip
cd interbench-master/
make
cd ~/

echo "#!/bin/sh
./interbench-master/interbench -L \$NUM_CPU_CORES \$@ > \$LOG_FILE 2>&1
echo \$? > ~/test-exit-status" > interbench
chmod +x interbench
