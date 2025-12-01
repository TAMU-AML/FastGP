# FastGP
Code for the paper: `Fast Gaussian Process Approximations for Autocorrelated Data`

## Description: 
This code repository contains the code to reproduce the tables and figures in the paper: Fast Gaussian Process Approximations for Autocorrelated Data. This document explains the data and provides instruction to execute the code. 

## Computer and software environment: 
All experiments were implemented in R and executed on the Georgia Tech PACE high-performance computing cluster (RHEL7 Phoenix). The computations used Intel CPU-only nodes with 5 cores per job.


## Code Execution:
Each of the tables and figures have their own scripts. Before running any script, make sure `source.R` is executed so all functions are loaded.
The required packages are listed on top of this script.


  | Which results to reproduce | Data File | Code File | Output | Runtime |
  |------------|-------------------|---------|-----|---------|
  | Figure 4 | robot_data | `figure_4.R` | pacf_plot | 3 seconds|
  | Tables 1,2 | robot_data | `robot_table_1_2.R` | table1_disp table2_disp | 103.2 hours| 
  | Tables 3,4,5 | LaGP website | `robot_table_3_4_5.R` | table3_disp table4_disp table5_disp | 9.5 hours| 
  | Tables 6,7,9 | DSWE book | `robot_table_6_7_9.R`| table6_disp table7_disp table9_disp | 73.8 hours| 
  | Tables 8,9 | DSWE book | `robot_table_8_9.R` | table8_disp table9_disp | 23.6 hours| 
  | Figure 5 | DSWE book | `figure_5.R`| T_num_plot | 17.8 minutes | 
  | Figure 6 | DSWE book | `figure_6.R`| stability_plot | 3.2 hours | 

**Note:** 

- Table 9 includes runtime for both dataset 5 and 6 of wind data in two rows. First row is created by `wind5_table_6_7_9.R` and second with `wind6_table_8_9.R`.
- Using a laptop to run the code may slightly slow down the approximation methods in general, but `tempGP` in particular can become prohibitively slow.

## Datasets:

Three datasets are used for conducting numerical experiments, simulated robot arm data is uploaded to this package. The other datasets like laGP and DSWE data needs to be downloaded from their websites.

| Script | Data |
|-------|-------------|
|  Figure 4  and Tables 1,2  | These two scripts do use the robot_data from this package. |
|||
| Tables 3,4,5 | This script requires data from the laGP website. Download all files from [laGP data](https://bitbucket.org/gramacylab/tpm/src/master/data/HST/) and specify the directory path at the top of the script.|
|||
| Tables 6,7,9 |  This script requires data from the DSWE book's dataset. Download all files from [Dataset 5](https://zenodo.org/records/5516552) and specify the directory path at the top of the script.|
|||
| Tables 8,9 and Figure 5 and Figure 6|  This script requires data from the DSWE book's dataset. Download all files from [Dataset 6](https://zenodo.org/records/5516554) and specify the directory path at the top of the script.|

****
