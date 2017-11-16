#################################################################################
## package name: FE
## author: Yukai Yang
## Statistiska Inst., Uppsala Universitet
#################################################################################

#################################################################################
## data sets
#################################################################################

#' Dow Jones daily
#'
#' Daily Dow Jones Industrial Average.
#' 18839 daily observations of closing prices, spanning 01/1915-02/1990.
#'
#' @format A tibble with 18838 rows and 3 variables:
#' \describe{
#'   \item{Date}{dates in the format "mmddyy".}
#'   \item{Dow_Jones}{daily Dow Jones Industial Average prices.}
#'   \item{r_Dow_Jones}{log returns of the daily Dow Jones Industial Average prices.}
#' }
"DJ_d"

#' Dow Jones weekly
#'
#' Weekly Dow Jones Industrial Average.
#' 4686 weekly observations of high, low and closing prices, spanning 01/1900-10/1989.
#'
#' @format A tibble with 4686 rows and 5 variables:
#' \describe{
#'   \item{Date}{dates in the format "mmddyy".}
#'   \item{High}{weekly Dow Jones Industial Average high.}
#'   \item{Low}{weekly Dow Jones Industial Average low.}
#'   \item{Close}{weekly Dow Jones Industial Average close prices.}
#'   \item{r_close}{log returns of the weekly Dow Jones Industial Average close prices.}
#' }
"DJ_w"

#' Daily international stock indexes
#'
#' 3128 daily observations of the following stock indexes with some missing observations, spanning 06/01/86 to 31/12/97.
#'
#' @format A tibble with 3128 rows and 7 variables:
#' \describe{
#'   \item{DAXINDX}{German DAX}
#'   \item{FRCAC40}{Paris}
#'   \item{FTSE100}{London}
#'   \item{HNGKNGI}{Hong Kong}
#'   \item{NIKKEI}{Tokyo}
#'   \item{SNGALLS}{Singapore All Shares}
#'   \item{SPCOMP}{S&P500 New York}
#' }
"index_d"

#' Value-weighted returns for size portfolios
#'
#' Value-weighted returns for size portfolios based on stocks traded at the NYSE and AMEX.
#'
#' The portfolios are reconstructed every June based on market capitalization (cap).
#' The data set contains the returns of portfolios associated
#' with the low 30%, mid 40%, top 30% quantile as well as with 5 quintiles and 10 deciles.
#'
#' Moreover, it includes the value-weighted return on all NYSE, AMEX, and NASDAQ stocks (from CRSP) as a proxy for the market return as well as the one-month Treasury bill rate.
#'
#' Note that all returns are measured in percent!
#'
#' 942 monthly observations, spanning 07/1926-12/2004.
#'
#' \itemize{
#'   \item Date, dates in the format "yyyymm".
#'   \item Lo_30, portfolio returns for low 30\%.
#'   \item Mid_40, portfolio returns for mid 40\%.
#'   \item Hi_30, portfolio returns for top 30\%.
#'   \item Lo_20, portfolio returns for low 20\%.
#'   \item Hi_20, portfolio returns for top 20\%.
#'   \item Lo_10, portfolio returns for low 10\%.
#'   \item Hi_10, portfolio returns for top 10\%.
#'   \item Xyy.yy, portfolio returns for yy-yy\%.
#'   \item Rf, risk-free one-month Treasury bill returns.
#'   \item Market, the value-weighted return on all NYSE, AMEX, and NASDAQ stocks (from CRSP) as a proxy for the market return.
#' }
#'
#' @format A tibble with 942 rows and 21 variables:
"portcap_m"


#' Value-weighted returns for portfolios
#'
#' Value-weighted returns for 10 size decile portfolios,
#' 10 book-to-market decile portfolios
#' as well as 100 size/book-to-market (ME-BE/ME) portfolios based on stocks traded at the NYSE and AMEX.
#'
#' The portfolios are reconstructed every June.
#'
#' The 100 ME-BE/ME portfolios are constructed based on the intersections of 10 size deciles 10 BE/ME deciles.
#'
#' Moreover, it includes the value-weighted return on all NYSE, AMEX, and NASDAQ stocks (from CRSP) as a proxy for the market as well as the one-month Treasury bill rate.
#'
#' Note that all returns are measured in percent!
#'
#' 942 monthly observations, 07/1926-12/2004.
#'
#' \itemize{
#'   \item year, year in integers.
#'   \item month, month in integers
#'   \item Market, value-weighted return on all NYSE, AMEX, and NASDAQ stocks (from CRSP) as a proxy for the market return.
#'   \item Tbill, one-month Treasury bill rate.
#'   \item MEx, portfolio returns for the x_th size decile.
#'   \item MEBEx, portfolio returns for the x_th book-to-market decile.
#'   \item Rx(x)y(y), portfolio returns for the x(x)/y(y) size/book-to-market percentile.
#' }
#'
#' @format A tibble with 942 rows and 124 variables:
"portfolio_m"


#' SMB and HML factor as constructed by Fama and French (1993).
#'
#' SMB is the difference between the returns on a small-stock portfolio (based on the low 30% quantile of market capitalization) and the returns on a big-stock portfolio (based on the top 30% quantile of market capitalization).
#'
#' HML is the difference between the returns on a low-book-to-market portfolio (based on the low 30% quantile of the book-to-market equity ratio) and the returns on a high-book-to-market portfolio (based on the top 30% quantile of the book-to-market equity ratio).
#'
#' Moreover, it includes the value-weighted return on all NYSE, AMEX, and NASDAQ stocks (from CRSP) as a proxy for the market as well as the one-month Treasury bill rate.
#'
#' Note that all returns are measured in percent!
#'
#' 942 monthly observations, 07/1926-12/2004.
#'
#' \itemize{
#'   \item year, year in integers.
#'   \item month, month in integers
#'   \item Market, value-weighted return on all NYSE, AMEX, and NASDAQ stocks (from CRSP) as a proxy for the market return.
#'   \item Tbill, one-month Treasury bill rate.
#'   \item SMB, difference between the returns on a small-stock portfolio (based on the low 30% quantile of market capitalization) and the returns on a big-stock portfolio (based on the top 30% quantile of market capitalization).
#'   \item HML, difference between the returns on a low-book-to-market portfolio (based on the low 30% quantile of the book-to-market equity ratio) and the returns on a high-book-to-market portfolio (based on the top 30% quantile of the book-to-market equity ratio).
#' }
#'
#' @format A tibble with 942 rows and 6 variables:
"factors_m"
