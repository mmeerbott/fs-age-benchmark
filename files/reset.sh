#!/bin/bash

umount aged/
umount flat/

mount /dev/mmcblk0p3 aged/
mount /dev/mmcblk0p4 flat/
ls aged/
ls flat/
rm -rf aged/*
rm -rf flat/*

umount aged/
umount flat/

mount /dev/mmcblk0p1 aged/
mount /dev/mmcblk0p2 flat/
ls aged/
ls flat/
rm -rf aged/*
rm -rf flat/*

umount aged/
umount flat/
