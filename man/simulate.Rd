% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate-methods.R
\name{simulate.gam}
\alias{simulate.gam}
\alias{simulate.gamm}
\alias{simulate.scam}
\title{Simulate from the posterior distribution of a GAM}
\usage{
\method{simulate}{gam}(object, nsim = 1, seed = NULL, newdata = NULL,
  freq = FALSE, unconditional = FALSE, ...)

\method{simulate}{gamm}(object, nsim = 1, seed = NULL, newdata = NULL,
  freq = FALSE, unconditional = FALSE, ...)

\method{simulate}{scam}(object, nsim = 1, seed = NULL, newdata = NULL,
  freq = FALSE, parametrized = TRUE, ...)
}
\arguments{
\item{object}{a fitted GAM, typically the result of a call to \code{gam()} or \code{gamm()}.}

\item{nsim}{numeric; the number of posterior simulations to return.}

\item{seed}{numeric; a random seed for the simulations.}

\item{newdata}{data frame; new observations at which the posterior draws from the model should be evaluated. If not supplied, the data used to fit the model will be used for \code{newdata}, if available in \code{object}.}

\item{freq}{logical; \code{TRUE} to return the frequentist covariance matrix of the parameter estimators, \code{FALSE} to return the Bayesian posterior covariance matrix of the parameters.}

\item{unconditional}{logical; if \code{TRUE} (and \code{freq == FALSE}) then the Bayesian smoothing parameter uncertainty corrected covariance matrix is returned, if available.}

\item{...}{arguments passed to methods}

\item{parametrized}{logical; use parametrized coefficients and covariance matrix, which respect the linear inequality constraints of the model.}
}
\value{
(Currently) A matrix with \code{nsim} columns.
}
\description{
Simulations from the posterior distribution of a fitted GAM model involve making random draws from a multivariate normal with mean vector equal to the estimated model coefficients and covariance matrix equal to the covariance matrix of the coefficients.
}
\examples{
library("mgcv")
set.seed(2)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
m1 <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")

sims <- simulate(m1, nsim = 5, seed = 42)
head(sims)

m2 <- gamm(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")

sims <- simulate(m2, nsim = 5, seed = 42)
head(sims)
}
\author{
Gavin L. Simpson
}
