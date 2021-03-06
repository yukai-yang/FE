% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/capm.R
\name{Fama_MacBeth}
\alias{Fama_MacBeth}
\title{Implement the Fama-MacBeth two-step cross-sectional regressions}
\usage{
Fama_MacBeth(mZ, vZm)
}
\arguments{
\item{mZ}{matrix of the excess returns for N assets with dimension T by N.}

\item{vZm}{vector of the excess returns for the market portfolio.}
}
\value{
a list containing the following results:
\item{alpha}{estimated alpha.}
\item{beta}{estimated market beta.}
\item{mE}{matrix of the residuals.}
\item{Sigma}{estimated covariance matrix of the errors.}
\item{gamma_0}{estimated intercepts in the second pass.}
\item{gamma_1}{estimated risk premium in the second pass.}
}
\description{
This function Implement the Fama-MacBeth two-step cross-sectional regressions.
}
\details{
The first pass has been described in \code{\link{EstCAPM}}.

The second pass are the regressions
\deqn{Z_t = \gamma_{0t} \iota + \gamma_{1t} \hat{\beta} + \eta_t}
for each time period \eqn{t}, where \eqn{\hat{\beta}} is the estimated beta from the first pass,
and \eqn{\gamma_{1t}} is the market risk premium.
}
\author{
Yukai Yang, \email{yukai.yang@statistik.uu.se}
}
\keyword{#'}
\keyword{-}
\keyword{=}
\keyword{@examples}
\keyword{Fama_MacBeth(mZ,}
\keyword{c(vRf)}
\keyword{capm}
\keyword{mR}
\keyword{mZ}
\keyword{portfolio_m[,25:124]}
\keyword{portfolio_m[,3]}
\keyword{portfolio_m[,4]}
\keyword{ret}
\keyword{vRf}
\keyword{vRm}
\keyword{vZm}
\keyword{vZm)}
