<!-- README.md is generated from README.Rmd. Please edit that file -->
FE version 1.0.0
================

This package is developed for the students who attend the master and PhD course "Financial Econometrics". It facilitates the downloading and manipulation of the data sets used in the course.

You install the package by running

``` r
if(!require(devtools)) install("devtools")
devtools::install_github("yukai-yang/FE")
```

and attach the package by running

``` r
library("FE")
```

You can take a look at all the available data sets and functions in the package

``` r
ls( grep("FE", search()) ) 
#> [1] "DJ_d"      "DJ_w"      "index_d"   "portcap_m" "version"
```
