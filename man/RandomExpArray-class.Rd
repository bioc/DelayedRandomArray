% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RandomExpArray-class.R
\docType{class}
\name{RandomExpArray-class}
\alias{RandomExpArray-class}
\alias{RandomExpArraySeed-class}
\alias{RandomExpMatrix-class}
\alias{sampleDistrParam,RandomExpArraySeed-method}
\alias{sampleDistrFun,RandomExpArraySeed-method}
\alias{matrixClass,RandomExpArray-method}
\alias{RandomExpArraySeed}
\alias{DelayedArray,RandomExpArraySeed-method}
\alias{RandomExpArray}
\title{DelayedArray of random exponential values}
\usage{
RandomExpArraySeed(dim, rate = 1, chunkdim = NULL)

\S4method{DelayedArray}{RandomExpArraySeed}(seed)

RandomExpArray(dim, rate = 1, chunkdim = NULL)
}
\arguments{
\item{dim}{Integer vector of positive length, specifying the dimensions of the array.}

\item{rate}{Numeric vector used as \code{rate} in \code{\link{qexp}}.
Alternatively, a numeric array-like object with the same dimensions as \code{dim}.}

\item{chunkdim}{Integer vector of length equal to \code{dim}, containing the dimensions of each chunk.}

\item{seed}{A RandomExpArraySeed object.}
}
\value{
All constructors return an instance of a RandomExpArray object,
containing random draws from a exponential distribution with the specified parameters.
}
\description{
A \linkS4class{DelayedArray} subclass that performs on-the-fly sampling of exponentially distributed values.
}
\examples{
X <- RandomExpArraySeed(c(1e5, 1e5))
Y <- DelayedArray(X)
Y

# Fiddling with the distribution parameters:
X2 <- RandomExpArraySeed(c(1e5, 1e5), rate=runif(1e5))
Y2 <- DelayedArray(X2)
Y2

# Using another array as input:
library(Matrix)
rate <- rsparsematrix(1e5, 1e5, density=0.00001)
rate <- abs(DelayedArray(rate)) + 1
X3 <- RandomExpArraySeed(c(1e5, 1e5), rate=rate)
Y3 <- DelayedArray(X3)
Y3

}
\seealso{
The \linkS4class{RandomArraySeed} class, for details on chunking and the distributional parameters.
}
\author{
Aaron Lun
}
