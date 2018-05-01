#!/bin/bash

# output is in format
# $PULL_NUM $SIZE $AGED $UNAGED

# git script params
SRC_REPO="/home/michael/osproj/linux/"
DEST="/home/michael/osproj/aged"
OUTPUT_FILE="/home/michael/osproj/f2fs_aged_out.txt"
TOTAL_PULLS="5000"
PULLS_PER_TEST="50"
TEST_SCRIPT="/home/michael/osproj/fs-age-benchmark/grep_f2fs.sh"

# test script params
PATH_TO_AGED="/home/michael/osproj/aged"
AGED_BLK_DEV="/dev/mmcblk0p3"
PATH_TO_UNAGED="/home/michael/osproj/flat"
UNAGED_BLK_DEV="/dev/mmcblk0p4"

umount $PATH_TO_AGED
umount $PATH_TO_UNAGED
mount  $AGED_BLK_DEV $PATH_TO_AGED
mount  $UNAGED_BLK_DEV $PATH_TO_UNAGED

#python /home/michael/osproj/fs-age-benchmark/git_benchmark.py $SRC_REPO $DEST $OUTPUT_FILE $TOTAL_PULLS $PULLS_PER_TEST $TEST_SCRIPT $PATH_TO_AGED $AGED_BLK_DEV $PATH_TO_UNAGED $UNAGED_BLK_DEV | tee -a master_output_f2fs.txt

OUTPUT_FILE="/home/michael/osproj/ext4_aged_out.txt"
TEST_SCRIPT="/home/michael/osproj/fs-age-benchmark/grep_ext4.sh"
AGED_BLK_DEV="/dev/mmcblk0p1"
UNAGED_BLK_DEV="/dev/mmcblk0p2"

umount $PATH_TO_AGED
umount $PATH_TO_UNAGED
mount  $AGED_BLK_DEV $PATH_TO_AGED
mount  $UNAGED_BLK_DEV $PATH_TO_UNAGED

python /home/michael/osproj/fs-age-benchmark/git_benchmark.py $SRC_REPO $DEST $OUTPUT_FILE $TOTAL_PULLS $PULLS_PER_TEST $TEST_SCRIPT $PATH_TO_AGED $AGED_BLK_DEV $PATH_TO_UNAGED $UNAGED_BLK_DEV | tee -a master_output_ext4.txt
