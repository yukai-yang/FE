#################################################################################
## package name: FE
## author: Yukai Yang
## Statistiska Inst., Uppsala Universitet
#################################################################################

#################################################################################
## log-likelihood calculation
#################################################################################

#' Compute the log-likelihood function based on the residuals from a regression.
#'
#' This function computes the log-likelihood function based on a matrix of residuals obtained from a regression.
#'
#' The assumptions of the regression model contain the multivariate normality of the error vectors.
#'
#' It computes the following function value
#' \deqn{-\frac{NT}{2}\log 2 \pi - \frac{T}{2}\log |\hat{\Sigma}| - \frac{1}{2} \sum_{t=1}^T e_t' \hat{\Sigma} e_t}
#' where \eqn{e_t} is the residual vector at time t (the t's row of \code{mE}),
#' and \eqn{\hat{\Sigma}} is the covariance matrix of the residuals (the estimated covariance matrix of the errors).
#'
#' @param mE a T by N matrix of residuals obtained from a regression.
#'
#' @return log-likelihood function.
#'
#' @author Yukai Yang, \email{yukai.yang@@statistik.uu.se}
#' @keywords log-likelihood
#'
#' @examples
#' mR = portfolio_m[,25:124]
#' vRm = portfolio_m[,3]
#' vRf = portfolio_m[,4]
#'
#' mZ = mR - c(vRf)
#' vZm = vRm - c(vRf)
#'
#' ## get the residuals
#' mE = EstCAPM(mZ, vZm)$mE
#'
#' LogLikelihood(mE)
#'
#' @export
LogLikelihood <- function(mE)
{
  iT = nrow(mE)
  iN = ncol(mE)
  mS = crossprod(mE)/iT
  invS = chol2inv(chol(mS))

  ret = iN*iT*log(2*pi) + iT*log(det(mS))
  ret = ret + sum(diag(mE%*%invS%*%t(mE)))

  return(-.5*ret)
}
