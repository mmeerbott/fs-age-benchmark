#!/bin/bash
################################################################################
# grep_f2fs.sh
# Made to be used with the scripts from the method of aging from
# "How to Fragment Your File System" by A. Conway et al
# from their GitHub project Git-Benchmark. Source:
# https://github.com/aineshbakshi/Git-Benchmark
################################################################################
# performs aged grep tests on f2fs
#
# usage:
# ./grep_f2fs.sh path_to_aged aged_blk_device path_to_unaged unaged_blk_device
#
################################################################################

AGED_PATH=$1
AGED_BLKDEV=$2
UNAGED_PATH=$3
UNAGED_BLKDEV=$4

# remount aged and time a recursive grep
umount $AGED_PATH &>> log_f2fs.txt
mount $AGED_BLKDEV $AGED_PATH &>> log_f2fs.txt
AGED="$(TIMEFORMAT='%3R'; time (grep -r "t26EdaovJD" $AGED_PATH) 2>&1)"
SIZE="$(du -s $AGED_PATH | awk '{print $1}')"

# create a new f2fs filesystem, mount it, time a recursive grep and dismount it
mkfs.f2fs $UNAGED_BLKDEV #&>> log_f2fs.txt
mount $UNAGED_BLKDEV $UNAGED_PATH &>> log_f2fs.txt
cp -a $AGED_PATH/* $UNAGED_PATH 2>/dev/null
umount $UNAGED_PATH &>> log_f2fs.txt
mount $UNAGED_BLKDEV $UNAGED_PATH
UNAGED="$(TIMEFORMAT='%3R'; time (grep -r "t26EdaovJD" $UNAGED_PATH) 2>&1)"
umount $UNAGED_PATH &>> log_f2fs.txt

# return the size and times
echo "$SIZE $AGED $UNAGED"

