#' DelayedArray of random F-distributed values
#'
#' A \linkS4class{DelayedArray} subclass that performs on-the-fly sampling of F-distributed values.
#'
#' @param dim Integer vector of positive length, specifying the dimensions of the array.
#' @param df1,df2,ncp Numeric vector used as the argument of the same name in \code{\link{qf}}.
#' Alternatively, a numeric array-like object with the same dimensions as \code{dim}.
#'
#' If \code{ncp} is missing, a central F distribution is assumed.
#' @param chunkdim Integer vector of length equal to \code{dim}, containing the dimensions of each chunk.
#' @param seed A RandomFArraySeed object.
#' 
#' @return 
#' All constructors return an instance of a RandomFArray object,
#' containing random draws from a exponential distribution with the specified parameters.
#'
#' @author Aaron Lun
#' 
#' @aliases
#' RandomFArray-class
#' RandomFArraySeed-class
#' RandomFMatrix-class
#' sampleDistrParam,RandomFArraySeed-method
#' sampleDistrFun,RandomFArraySeed-method
#' matrixClass,RandomFArray-method
#' extract_array,RandomFArraySeed-method
#'
#' @seealso
#' The \linkS4class{RandomArraySeed} class, for details on chunking and the distributional parameters.
#' 
#' @examples
#' X <- RandomFArraySeed(c(1e5, 1e5), df1=1, df2=10)
#' Y <- DelayedArray(X)
#' Y
#'
#' # Fiddling with the distribution parameters:
#' X2 <- RandomFArraySeed(c(1e5, 1e5), df1=runif(1e5)*10, df2=10)
#' Y2 <- DelayedArray(X2)
#' Y2
#'
#' # Using another array as input:
#' library(Matrix)
#' ncp <- rsparsematrix(1e5, 1e5, density=0.00001)
#' ncp <- abs(DelayedArray(ncp)) + 1
#' X3 <- RandomFArraySeed(c(1e5, 1e5), df1=1, df2=10, ncp=ncp)
#' Y3 <- DelayedArray(X3)
#' Y3
#' 
#' @docType class
#' @name RandomFArray-class
NULL

#' @export
#' @rdname RandomFArray-class
RandomFArraySeed <- function(dim, df1, df2, ncp, chunkdim=NULL) {
    if (missing(ncp)) {
        ncp <- NULL
    }
    new("RandomFArraySeed", dim=dim, df1=df1, df2=df2, ncp=ncp, chunkdim=chunkdim)
}

setValidity2("RandomFArraySeed", function(object) {
    if (!is.null(object@ncp)) {
        msg <- .is_valid_param(object@dim, object@ncp, "ncp")
        if (!is.null(msg)) {
            return(msg)
        }
    }
    TRUE
})

#' @export
setMethod("sampleDistrParam", "RandomFArraySeed", function(x) c("df1", "df2"))

#' @export
setMethod("sampleDistrFun", "RandomFArraySeed", function(x) stats::qf)

#' @export
setMethod("extract_array", "RandomFArraySeed", .ncp_extract_array)

#' @export
setMethod("matrixClass", "RandomFArray", function(x) "RandomFMatrix")

#' @export
#' @rdname RandomFArray-class
setMethod("DelayedArray", "RandomFArraySeed", function(seed) new_DelayedArray(seed, Class="RandomFArray"))

#' @export
#' @rdname RandomFArray-class
RandomFArray <- function(dim, df1, df2, ncp, chunkdim=NULL) {
    DelayedArray(RandomFArraySeed(dim, df1=df1, df2=df2, ncp=ncp, chunkdim=chunkdim))
}
