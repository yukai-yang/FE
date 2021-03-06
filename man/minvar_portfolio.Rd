% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/capm.R
\name{minvar_portfolio}
\alias{minvar_portfolio}
\title{Compute the minimum-variance portfolio}
\usage{
minvar_portfolio(mu, Omega, mu_p = NULL)
}
\arguments{
\item{mu}{a vector of returns of some assets.}

\item{Omega}{a positive definite covariance matrix of the returns.}

\item{mu_p}{a scalar of the expected return of some portfolio, by default \code{NULL}.}
}
\value{
a list containing the following results:
\item{w_g}{the weights of the global minimum-variance portfolio.}
\item{mu_g}{the expected return of the global portfolio.}
\item{var_g}{the variance of the global portfolio.}
\item{w_p}{the weights of the portfolio which achieves the return \code{mu_p}.}
\item{mu_p}{the expected return of the portfolio.}
\item{var_p}{the variance of the portfolio.}
}
\description{
This function computes the minimum-variance portfolio given the expectations and covariance matrix of some asset returns.
}
\details{
If the expected return of the portfolio is not provided, the function finds the global minimum-variance portfolio.
The restuls contain the expected return of the global minimim-variance portfolio,
the corresponding weights of the portfolio,
and the minimum-variance.

If the expected return of the portfolio is provided, the function finds the optimal portfolio which achieves the given expected return \code{mu_p} as well as the global one.
The restuls contain the expected return of the optimal portfolio which achieves the expected return \code{mu_p},
the corresponding weights of the portfolio,
and the minimum-variance.
}
\examples{
Omega = crossprod(matrix(rnorm(25),5,5))
mu = runif(5,min=.05,max=.15)

minvar_portfolio(mu, Omega)

}
\author{
Yukai Yang, \email{yukai.yang@statistik.uu.se}
}
\keyword{capm}
