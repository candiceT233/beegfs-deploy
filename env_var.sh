#!/bin/bash

# User Directories
INSTALL_DIR=$HOME/install
DL_DIR=$HOME/download
SERVER_HOST_FILE_DIR=./host_file_dir

mkdir -p $INSTALL_DIR
mkdir -p $DL_DIR

# database content -----------
BEEGFS_PATH=$INSTALL_DIR/beegfs
sudo mkdir -p $BEEGFS_PATH

# database directories -----------

BEEGFS_DATA=/data/beegfs

BEEGFS_CLUSTER=/mnt/beegfs

BEEGFS_LOGS=/usr/local/beegfs/logs

sudo mkdir -p $BEEGFS_DATA
sudo mkdir -p $BEEGFS_CLUSTER
sudo mkdir -p $BEEGFS_LOGS
sudo chown $USER:$USER $BEEGFS_DATA
sudo chown $USER:$USER $BEEGFS_CLUSTER
sudo chown $USER:$USER $BEEGFS_LOGS
