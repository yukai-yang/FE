#################################################################################
## package name: FE
## author: Yukai Yang
## Statistiska Inst., Uppsala Universitet
#################################################################################

#################################################################################
## CAPM models
#################################################################################

#' Compute the betas provided the returns and covariance matrx of some assets and a portfolio.
#'
#' This function computes the betas by inputting the vector of returns and the covaraince matrix of some assets
#' as well as a vector of weights of some portfolio.
#'
#' @param wt_p a vector of weights of some portfolio.
#' @param mu a vector of returns of some assets.
#' @param Omega a positive definite covaraince matrix of the returns.
#'
#' @return a vector of betas.
#'
#' @author Yukai Yang, \email{yukai.yang@@statistik.uu.se}
#' @keywords capm
#'
#' @examples
#' Omega = crossprod(matrix(rnorm(25),5,5))
#' mu = runif(5,min=.05,max=.15)
#' wt_p = rnorm(5)
#' wt_p = wt_p/sum(wt_p)
#'
#' betas(wt_p, mu, Omega)
#'
#' @export
betas <- function(wt_p, mu, Omega)
{
  sigma_pp = c(t(wt_p)%*%Omega%*%wt_p)
  sigma_jp = c(Omega%*%wt_p)

  return(sigma_jp/sigma_pp)
}

#' Compute the minimum-variance portfolio
#'
#' This function computes the minimum-variance portfolio given the expectations and covariance matrix of some asset returns.
#'
#' If the expected return of the portfolio is not provided, the function finds the global minimum-variance portfolio.
#' The restuls contain the expected return of the global minimim-variance portfolio,
#' the corresponding weights of the portfolio,
#' and the minimum-variance.
#'
#' If the expected return of the portfolio is provided, the function finds the optimal portfolio which achieves the given expected return \code{mu_p} as well as the global one.
#' The restuls contain the expected return of the optimal portfolio which achieves the expected return \code{mu_p},
#' the corresponding weights of the portfolio,
#' and the minimum-variance.
#'
#' @param mu a vector of returns of some assets.
#' @param Omega a positive definite covariance matrix of the returns.
#' @param mu_p a scalar of the expected return of some portfolio, by default \code{NULL}.
#'
#' @return a list containing the following results:
#' \item{w_g}{the weights of the global minimum-variance portfolio.}
#' \item{mu_g}{the expected return of the global portfolio.}
#' \item{var_g}{the variance of the global portfolio.}
#' \item{w_p}{the weights of the portfolio which achieves the return \code{mu_p}.}
#' \item{mu_p}{the expected return of the portfolio.}
#' \item{var_p}{the variance of the portfolio.}
#'
#' @author Yukai Yang, \email{yukai.yang@@statistik.uu.se}
#' @keywords capm
#'
#' @examples
#' Omega = crossprod(matrix(rnorm(25),5,5))
#' mu = runif(5,min=.05,max=.15)
#'
#' minvar_portfolio(mu, Omega)
#'
#' @export
minvar_portfolio <- function(mu, Omega, mu_p=NULL)
{
  invOmega = chol2inv(chol(Omega))
  tmpa = c(t(mu)%*%invOmega%*%mu)
  tmpb = sum(invOmega%*%mu)
  tmpc = sum(invOmega)

  ret = list()

  ret$mu_g = tmpb/tmpc
  ret$w_g = rowSums(invOmega)/tmpc
  ret$var_g = c(t(ret$w_g)%*%Omega%*%ret$w_g)

  if(!is.null(mu_p)){
    ret$mu_p = mu_p
    ret$w_p = c(invOmega %*% (mu * (tmpc*mu_p-tmpb) + (tmpa-tmpb*mu_p)) / (tmpa*tmpc - tmpb*tmpb))
    ret$var_p = c(t(ret$w_p)%*%Omega%*%ret$w_p)
  }

  return(ret)
}

#' Implement the Sharpe-Lintner's version of the CAPM
#'
#' This function implements the Sharpe-Lintner's version of the CAPM model.
#'
#' The function takes the arguments of some returns and their covariance matrix, and a risk-free return.
#' It returns a list containing the weights, expected return and variance of the market portfolio or the tangency portfolio.
#'
#' If some expected return \code{mu_p} is provided, then it also returns the weights and variance of the portfolio which achieves it.
#'
#' @param mu a vector of returns of some assets.
#' @param Omega a positive definite covariance matrix of the returns.
#' @param rf a risk-free return.
#' @param mu_p a scalar of the expected return of some portfolio, by default \code{NULL}.
#'
#' @return a list containing the following results:
#' \item{w_m}{the weights of the market portfolio.}
#' \item{mu_m}{the expected return of the market portfolio.}
#' \item{var_m}{the variance of the market portfolio.}
#' \item{w_p}{the weights of the portfolio which achieves the return \code{mu_p} together with a risk-free asset with return \code{rf}.}
#' \item{mu_p}{the expected return of the portfolio.}
#' \item{var_p}{the variance of the portfolio.}
#'
#' @author Yukai Yang, \email{yukai.yang@@statistik.uu.se}
#' @keywords capm
#'
#' @examples
#' Omega = crossprod(matrix(rnorm(25),5,5))
#' mu = runif(5,min=.05,max=.15)
#'
#' SharpeLintner(mu, Omega, .02)
#'
#' @export
SharpeLintner <- function(mu, Omega, rf, mu_p=NULL)
{
  invOmega = chol2inv(chol(Omega))

  ret = list()

  w_b = c(invOmega%*%(mu - rf))
  ret$w_m = w_b/sum(w_b)
  ret$mu_m = c(t(mu)%*%ret$w_m)
  ret$var_m = c(t(ret$w_m)%*%Omega%*%ret$w_m)

  if(!is.null(mu_p)){
    c_p = (mu_p - rf) / c(t(mu-rf)%*%invOmega%*%(mu-rf))
    ret$w_p = c_p * w_b
    #ret$mu_p = c(t(mu)%*%ret$w_p + (1-sum(ret$w_p))*rf)
    ret$mu_p = mu_p
    ret$var_p = c(t(ret$w_p)%*%Omega%*%ret$w_p)
  }

  return(ret)
}

#' Estimate the CAPM model
#'
#' This function estimates the Sharpe-Lintner CAPM model as follows:
#' \deqn{Z_t = \alpha + \beta Z_{mt} + \varepsilon_t.}
#' where \eqn{Z_t} is the excess returns for N assets,
#' \eqn{Z_{mt}} is the excess return of the market portfolio.
#'
#' @param mZ matrix of the excess returns for N assets with dimension T by N.
#' @param vZm vector of the excess returns of the market portfolio.
#'
#' @return a list containing the following results:
#' \item{alpha}{estimated alpha.}
#' \item{beta}{estimated market beta.}
#' \item{mE}{matrix of the residuals.}
#' \item{Sigma}{estimated covariance matrix of the errors.}
#'
#' @author Yukai Yang, \email{yukai.yang@@statistik.uu.se}
#' @keywords capm
#'
#' @examples
#' mR = portfolio_m[,25:124]
#' vRm = portfolio_m[,3]
#' vRf = portfolio_m[,4]
#'
#' mZ = mR - c(vRf)
#' vZm = vRm - c(vRf)
#'
#' ret = EstCAPM(mZ, vZm)
#'
#' @export
EstCAPM <- function(mZ, vZm)
{
  ret = list()
  mZ = as.matrix(mZ)

  mX = as.matrix(cbind(1, vZm))
  tmp = chol2inv(chol(crossprod(mX))) %*% crossprod(mX,mZ)

  ret$alpha = tmp[1,]
  ret$beta = tmp[2,]
  ret$mE = mZ - mX%*%tmp
  ret$Sigma = crossprod(ret$mE)/nrow(ret$mE)

  return(ret)
}


#' Implement the Fama-MacBeth two-step cross-sectional regressions
#'
#' This function Implement the Fama-MacBeth two-step cross-sectional regressions.
#'
#' The first pass has been described in \code{\link{EstCAPM}}.
#'
#' The second pass are the regressions
#' \deqn{Z_t = \gamma_{0t} \iota + \gamma_{1t} \hat{\beta} + \eta_t}
#' for each time period \eqn{t}, where \eqn{\hat{\beta}} is the estimated beta from the first pass,
#' and \eqn{\gamma_{1t}} is the market risk premium.
#'
#' @param mZ matrix of the excess returns for N assets with dimension T by N.
#' @param vZm vector of the excess returns for the market portfolio.
#'
#' @return a list containing the following results:
#' \item{alpha}{estimated alpha.}
#' \item{beta}{estimated market beta.}
#' \item{mE}{matrix of the residuals.}
#' \item{Sigma}{estimated covariance matrix of the errors.}
#' \item{gamma_0}{estimated intercepts in the second pass.}
#' \item{gamma_1}{estimated risk premium in the second pass.}
#'
#' @author Yukai Yang, \email{yukai.yang@@statistik.uu.se}
#' @keywords capm
#'
#' #' @examples
#' mR = portfolio_m[,25:124]
#' vRm = portfolio_m[,3]
#' vRf = portfolio_m[,4]
#'
#' mZ = mR - c(vRf)
#' vZm = vRm - c(vRf)
#'
#' ret = Fama_MacBeth(mZ, vZm)
#'
#' @export
Fama_MacBeth <- function(mZ, vZm)
{
  ret = EstCAPM(mZ, vZm)

  mX = cbind(1,ret$beta)
  tmp = chol2inv(chol(crossprod(mX))) %*% t(mX)

  tmpp = apply(mZ, 1, function(vy){c(tmp%*%vy)})
  ret$gamma_0 = tmpp[1,]
  ret$gamma_1 = tmpp[2,]

  return(ret)

}
