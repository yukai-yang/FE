<!-- README.md is generated from README.Rmd. Please edit that file -->
FE version 1.2.2
================

This package is developed for the students who attend the master and PhD course "Financial Econometrics". It facilitates the downloading and manipulation of the data sets used in the course.

You install the package by running

``` r
if(!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("yukai-yang/FE")
```

and attach the package by running

``` r
library("FE")
```

You can take a look at all the available data sets and functions in the package

``` r
ls( grep("FE", search()) ) 
#>  [1] "betas"            "DJ_d"             "DJ_w"            
#>  [4] "EstCAPM"          "factors_m"        "Fama_MacBeth"    
#>  [7] "index_d"          "LogLikelihood"    "minvar_portfolio"
#> [10] "PCA"              "portcap_m"        "portfolio_m"     
#> [13] "SharpeLintner"    "version"
```
