<!-- README.md is generated from README.Rmd. Please edit that file -->
FE version 1.0.0
================

This package is developed for the students who attend the master and PhD course "Financial Econometrics". It facilitates the downloading and manipulation of the data sets used in the course.

You install the package by running

``` r
if(!require(devtools)) install("devtools")
#> Loading required package: devtools
devtools::install_github("yukai-yang/FE")
#> Warning in strptime(x, fmt, tz = "GMT"): unknown timezone 'default/Europe/
#> Stockholm'
#> Downloading GitHub repo yukai-yang/FE@master
#> from URL https://api.github.com/repos/yukai-yang/FE/zipball/master
#> Installing FE
#> '/Library/Frameworks/R.framework/Resources/bin/R' --no-site-file  \
#>   --no-environ --no-save --no-restore --quiet CMD INSTALL  \
#>   '/private/var/folders/ds/dwv9n04d177_qdd4tpmcc3_80000gn/T/RtmpMzmMpY/devtools86b5a854494/yukai-yang-FE-2585563'  \
#>   --library='/Library/Frameworks/R.framework/Versions/3.4/Resources/library'  \
#>   --install-tests
#> 
```

and attach the package by running

``` r
library("FE")
```

You can take a look at all the available data sets and functions in the package

``` r
ls( grep("FE", search()) ) 
#> [1] "func"
```
