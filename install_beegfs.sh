#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "Please enter the number of hosts"
    exit 1
fi

source env_var.sh

num_s=$1
HOSTFILE=$SERVER_HOST_FILE_DIR/${num_s}_servers_ip

VERSION=7.3.3

install_components_local() {

    sudo yum install beegfs-mgmtd                               # management service
    sudo yum install beegfs-meta libbeegfs-ib                   # metadata service; libbeegfs-ib is only required for RDMA
    sudo yum install beegfs-storage libbeegfs-ib                # storage service; libbeegfs-ib is only required for RDMA
    sudo yum install beegfs-client beegfs-helperd beegfs-utils  # client and command-line utils
    # sudo yum install beegfs-admon                               # admon service (optional)

}

install_components_all() {
    mpssh -f "$HOSTFILE" "sudo yum install -y beegfs-mgmtd"                                # management service
    mpssh -f "$HOSTFILE" "sudo yum install -y beegfs-meta libbeegfs-ib"                   # metadata service; libbeegfs-ib is only required for RDMA
    mpssh -f "$HOSTFILE" "sudo yum install -y beegfs-storage libbeegfs-ib"                # storage service; libbeegfs-ib is only required for RDMA
    mpssh -f "$HOSTFILE" "sudo yum install -y beegfs-client beegfs-helperd beegfs-utils"  # client and command-line utils
    # mpssh -f "$HOSTFILE" "sudo yum install -y beegfs-admon"                               # admon service (optional)
}

install_components_all

