#################################################################################
## package name: FE
## author: Yukai Yang
## Statistiska Inst., Uppsala Universitet
#################################################################################

#################################################################################
## Factor models
#################################################################################


#' Principal component analysis
#'
#'
#'
#' @param mx matrix of variables, rows are observations and columns are variables.
#' @param num number of factors that you need.
#'
#' @return a list of the results.
#' \item{factors}{matrix of the factors found in PCA, rows are observations, columns are factors.}
#' \item{weights}{weights that produce the factors from the variables.}
#' \item{explained}{how much do the factors explain the variation of the variables, in percentage.}
#'
#' @author Yukai Yang, \email{yukai.yang@@statistik.uu.se}
#' @keywords factor
#'
#' @examples
#'
#' @export
PCA <- function(mx, num=1)
{
  tmp = eigen(cov(mx), symmetric=T)

  weights = tmp$vectors[,1:num]
  factors = mx %*% weights
  explained = tmp$values[1:num]/sum(tmp$values) * 100
  return(list(factors=factors,weights=weights, explained=explained))
}
