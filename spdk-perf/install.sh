#/bin/sh

pcieaddr=`lspci -D | grep "Non-Volatile memory" | awk '{ print $1 }'`
if [ -z "$pcieaddr" ]; then
   echo "No NVMe controller found!"
   echo 1 > ~/install-exit-status
else
    git clone https://github.com/spdk/spdk
    cd spdk
    git submodule update --init
    ./scripts/pkgdep.sh && ./configure && make -j`nproc`
    echo $? > ~/install-exit-status

    cd ~
    cat <<-EOF > spdk-perf
#!/bin/sh
./spdk/examples/nvme/perf/perf -r 'trtype:PCIe traddr:$pcieaddr' \$@ > \$LOG_FILE 2>&1
sed -i 's/\(Total \+: \+\)[0-9\.]\+ \+/\1/' \$LOG_FILE
echo \$? > ~/test-exit-status
EOF
    chmod +x spdk-perf
fi
