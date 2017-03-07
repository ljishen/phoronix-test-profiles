#!/bin/sh

tar -xvf rt-tests_1.0.orig.tar.xz
cd rt-tests-1.0/src/hackbench
gcc -g -Wall -O2 -o hackbench hackbench.c -lpthread
echo $? > ~/install-exit-status

cd ~
echo "#!/bin/sh
./rt-tests-1.0/src/hackbench/hackbench -s 1024 -l 500 -g 20 -f 50 -P > \$LOG_FILE 2>&1
echo \$? > ~/test-exit-status" > hackbench
chmod +x hackbench
