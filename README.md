# F2FS and EXT4 Reliability 
### FS Age Benchmarking
### Measuring reliability through aging
---

### Dependencies
`libf2fs0 f2fs-tools`

[Git-Benchmark Scripts](https://github.com/aineshbakshi/Git-Benchmark)
which are placed in `src/`: `git_benchmark.py grep_ext4.sh grep-f2fs.sh`

### How to Run
You'll need to install the dependencies before running.

This section includes the files:
``` 
    runner.sh
    git_benchmark.py
    grep_ext4.sh
    grep_f2fs.sh
    reset.sh
```

`runner.sh` is a wrapper that uses Git-Benchmark scripts

`reset.sh` is for resetting 
the SD card to start the tests over (deletes the SD card's contents).

To run the tests, I created `runner.sh` to run tests for both EXT4 and 
F2FS, so that it can run in background. You will need to change the 
variables in the file. Below is a summary of them.


>    `SRC_REPO`: 
>        the path to git repo on your computer to pull from.
>
>    `DEST`: 
>        the path to be aged
>
>    `OUTPUT_FILE`: 
>        the file you want the script to write to
>
>    `TOTAL_PULLS`: 
>        total number of pulls you want performed
>
>    `PULLS_PER_TEST`: 
>        the step/amount-of-pulls you want to perform grep-tests at
>
>    `TEST_SCRIPT`: 
>        the script that performs the grep tests


`PATH_TO_AGED`: 
    the path to the aged directory (you may need to create one)
`AGED_BLK_DEV`: 
    the device partition to age (found in /dev/)
`PATH_TO_UNAGED`: 
    the path to the aged directory (you may need to create one)
`UNAGED_BLK_DEV`: 
    the device partition that won't be aged (found in /dev/)


    Note: These variables are changed half way through the script. Make sure you
    change those as well. First half of the scipt is for F2FS, the other half is
    for EXT4.

### data/
This directory contains the data from running the experiments. Below is a 
description for each of the files.

`plots.gp`: 
    this file can be loaded in gnuplot to plot the results into a graph.

`data.dat`: 
    the data for each run, formatted for gnuplot for `plots.gp`.

`f2fs_aged_out.txt`: 
    the raw data (in text) from the F2FS runs, with each failed pull line 
    deleted, except for the first and last in each section.

`ext4_aged_out.txt`: 
    the same as the above, but for the EXT4 runs.

### report
Contains files for creating the report that was turned in for the course. Uses a makefile
to generate the PDF from a LaTeX file.
