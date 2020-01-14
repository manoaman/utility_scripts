#!/bin/bash

pass="Password1"
# tgtDir="/Volumes/Untitled/"
tgtDir="/Users/seita/Desktop/servers/"

for ((i=1;i<=6;i++));
do
    tgt=$tgtDir"image"$i"_mcp_loni_usc_edu"
    echo "mkdir -p $tgt"
    `mkdir -p $tgt`

    var=$tgt"/var/lib"
    echo "mkdir -p $var"
    `mkdir -p $var`

    tmp=$tgt"/tmp"
    echo "mkdir -p $tmp"
    `mkdir -p $tmp`

    home=$tgt"/home/mcpadmin"
    echo "mkdir -p $home"
    `mkdir -p $home`

    ssh="mcpadmin@image"$i".mcp.loni.usc.edu:"
    echo "sshpass -p $pass rsync -r $ssh/etc/ $tgt/etc"
    `sshpass -p $pass rsync -r $ssh/etc/ $tgt/etc`
    echo "sshpass -p $pass rsync -r $ssh/var/lib/apache2 $var"
    `sshpass -p $pass rsync -r $ssh/var/lib/apache2 $var`
    echo "sshpass -p $pass rsync --copy-links -r $ssh/var/www/ $tgt/var/www"
    `sshpass -p $pass rsync --copy-links -r $ssh/var/www/ $tgt/var/www`
    echo "sshpass -p $pass rsync -r $ssh/tmp/ $tmp"
    `sshpass -p $pass rsync -r $ssh/tmp/ $tmp`
    echo "sshpass -p $pass rsync -r $ssh$homdDir $home"
    `sshpass -p $pass rsync -r $ssh$homdDir $home`
    printf "\n"
done