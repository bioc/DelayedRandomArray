% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RandomWilcoxArray-class.R
\docType{class}
\name{RandomWilcoxArray-class}
\alias{RandomWilcoxArray-class}
\alias{RandomWilcoxArraySeed-class}
\alias{RandomWilcoxMatrix-class}
\alias{sampleDistrParam,RandomWilcoxArraySeed-method}
\alias{sampleDistrFun,RandomWilcoxArraySeed-method}
\alias{matrixClass,RandomWilcoxArray-method}
\alias{RandomWilcoxArraySeed}
\alias{DelayedArray,RandomWilcoxArraySeed-method}
\alias{RandomWilcoxArray}
\title{DelayedArray of random Wilcoxon-distributed values}
\usage{
RandomWilcoxArraySeed(dim, m, n, chunkdim = NULL, sparse = FALSE)

\S4method{DelayedArray}{RandomWilcoxArraySeed}(seed)

RandomWilcoxArray(dim, m, n, chunkdim = NULL)
}
\arguments{
\item{dim}{Integer vector of positive length, specifying the dimensions of the array.}

\item{m, n}{Numeric vector used as the argument of the same name in \code{\link{qwilcox}}.
Alternatively, a numeric array-like object with the same dimensions as \code{dim}.}

\item{chunkdim}{Integer vector of length equal to \code{dim}, containing the dimensions of each chunk.}

\item{sparse}{Logical scalar indicating whether the sampled array should be treated as sparse.}

\item{seed}{A RandomWilcoxArraySeed object.}
}
\value{
All constructors return an instance of a RandomWilcoxArray object,
containing random draws from a Wilcox distribution with the specified parameters.
}
\description{
A \linkS4class{DelayedArray} subclass that performs on-the-fly sampling of Wilcoxon-distributed values.
}
\examples{
X <- RandomWilcoxArraySeed(c(1e5, 1e5), m=10, n=20)
Y <- DelayedArray(X)
Y

# Fiddling with the distribution parameters:
X2 <- RandomWilcoxArraySeed(c(1e5, 1e5), m=round(runif(1e5, 10, 20)), n=20)
Y2 <- DelayedArray(X2)
Y2

# Using another array as input:
library(Matrix)
m <- round(RandomUnifArray(c(1e5, 1e5), 10, 20))
X3 <- RandomWilcoxArraySeed(c(1e5, 1e5), m=m, n=50)
Y3 <- DelayedArray(X3)
Y3

}
\seealso{
The \linkS4class{RandomArraySeed} class, for details on chunking and the distributional parameters.
}
\author{
Aaron Lun
}
