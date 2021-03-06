% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/capm.R
\name{betas}
\alias{betas}
\title{Compute the betas provided the returns and covariance matrx of some assets and a portfolio.}
\usage{
betas(wt_p, mu, Omega)
}
\arguments{
\item{wt_p}{a vector of weights of some portfolio.}

\item{mu}{a vector of returns of some assets.}

\item{Omega}{a positive definite covaraince matrix of the returns.}
}
\value{
a vector of betas.
}
\description{
This function computes the betas by inputting the vector of returns and the covaraince matrix of some assets
as well as a vector of weights of some portfolio.
}
\examples{
Omega = crossprod(matrix(rnorm(25),5,5))
mu = runif(5,min=.05,max=.15)
wt_p = rnorm(5)
wt_p = wt_p/sum(wt_p)

betas(wt_p, mu, Omega)

}
\author{
Yukai Yang, \email{yukai.yang@statistik.uu.se}
}
\keyword{capm}
