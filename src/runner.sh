#!/bin/bash

# output is in format
# $PULL_NUM $SIZE $AGED $UNAGED

# git script params
SRC_REPO="$HOME/osproj/linux/"
DEST="$HOME/osproj/aged"
OUTPUT_FILE="$HOME/osproj/f2fs_aged_out.txt"
TOTAL_PULLS="5000"
PULLS_PER_TEST="50"
TEST_SCRIPT="$HOME/osproj/fs-age-benchmark/grep_f2fs.sh"

# test script params
PATH_TO_AGED="$HOME/osproj/aged"
AGED_BLK_DEV="/dev/mmcblk0p3"
PATH_TO_UNAGED="$HOME/osproj/flat"
UNAGED_BLK_DEV="/dev/mmcblk0p4"

umount $PATH_TO_AGED
umount $PATH_TO_UNAGED
mount  $AGED_BLK_DEV $PATH_TO_AGED
mount  $UNAGED_BLK_DEV $PATH_TO_UNAGED

python ./git_benchmark.py $SRC_REPO $DEST $OUTPUT_FILE $TOTAL_PULLS $PULLS_PER_TEST $TEST_SCRIPT $PATH_TO_AGED $AGED_BLK_DEV $PATH_TO_UNAGED $UNAGED_BLK_DEV | tee -a ../output/master_output_f2fs.txt

OUTPUT_FILE="$HOME/osproj/ext4_aged_out.txt"
TEST_SCRIPT="$HOME/osproj/fs-age-benchmark/grep_ext4.sh"
AGED_BLK_DEV="/dev/mmcblk0p1"
UNAGED_BLK_DEV="/dev/mmcblk0p2"

umount $PATH_TO_AGED
umount $PATH_TO_UNAGED
mount  $AGED_BLK_DEV $PATH_TO_AGED
mount  $UNAGED_BLK_DEV $PATH_TO_UNAGED

python ./git_benchmark.py $SRC_REPO $DEST $OUTPUT_FILE $TOTAL_PULLS $PULLS_PER_TEST $TEST_SCRIPT $PATH_TO_AGED $AGED_BLK_DEV $PATH_TO_UNAGED $UNAGED_BLK_DEV | tee -a ../output/master_output_ext4.txt
