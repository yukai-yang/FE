#################################################################################
## package name: FE
## author: Yukai Yang
## Statistiska Inst., Uppsala Universitet
#################################################################################

#################################################################################
## utility functions
#################################################################################

vnum = "1.2.2"
location = "GitHub"

# simple cat
cat0 <- function(...)
{
  words = list(...)
  for(tmp in words) cat(tmp)
  cat("\n")
}


#' Show the version number of some information.
#'
#' This function shows the version number and some information of the package.
#'
#' @author Yukai Yang, \email{yukai.yang@@statistik.uu.se}
#' @keywords utils
#'
#' @export
version <- function(){
  cat0("Financial Econometrics Data Sets and Functions, version ", vnum, " from ",location)
}
